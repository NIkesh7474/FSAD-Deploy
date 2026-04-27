import express from 'express'
import cors from 'cors'
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'
import dotenv from 'dotenv'

dotenv.config()

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const app = express()
const PORT = process.env.PORT || 5000

app.use(cors())
app.use(express.json())

const loadMockData = async () => {
    const { mockData } = await import('./src/data/mockData.js')
    return {
        homestays: [...mockData.homestays],
        touristPlaces: [...mockData.touristPlaces],
        guides: [...mockData.guides],
        users: [...(mockData.users ?? [])],
        bookings: []
    }
}

const dataStore = await loadMockData()

const getNextId = (collection) => {
    if (!collection.length) return 1
    return Math.max(...collection.map((item) => item.id)) + 1
}

const findUserByIdentifier = (identifier) =>
    dataStore.users.find(
        (user) =>
            user.email?.toLowerCase() === identifier?.toLowerCase() ||
            user.username?.toLowerCase() === identifier?.toLowerCase()
    )

const sendSuccess = (res, payload = {}) => res.json({ success: true, ...payload })
const sendError = (res, message, status = 400) => res.status(status).json({ success: false, message })

app.get('/api/health', (_req, res) => {
    res.json({ status: 'ok' })
})

app.get('/api/homestays', (_req, res) => {
    res.json(dataStore.homestays)
})

app.get('/api/tourist-places', (_req, res) => {
    res.json(dataStore.touristPlaces)
})

app.get('/api/guides', (_req, res) => {
    res.json(dataStore.guides)
})

app.get('/api/users', (_req, res) => {
    const safeUsers = dataStore.users.map(({ password, ...user }) => user)
    res.json(safeUsers)
})

app.post('/api/auth/register', (req, res) => {
    const { username, email, password } = req.body
    if (!username || !email || !password) {
        return sendError(res, 'All registration fields are required.')
    }

    if (findUserByIdentifier(email) || findUserByIdentifier(username)) {
        return sendError(res, 'User already exists. Please log in instead.', 409)
    }

    const newUser = {
        id: getNextId(dataStore.users),
        username,
        email,
        password,
        role: 'user'
    }
    dataStore.users.push(newUser)
    const safeUser = { ...newUser }
    delete safeUser.password
    sendSuccess(res, { user: safeUser })
})

app.post('/api/auth/login', (req, res) => {
    const { identifier, password } = req.body
    if (!identifier || !password) {
        return sendError(res, 'Identifier and password are required.')
    }

    const user = findUserByIdentifier(identifier)
    if (!user || user.password !== password) {
        return sendError(res, 'Invalid credentials. Please try again.', 401)
    }

    const safeUser = { ...user }
    delete safeUser.password
    sendSuccess(res, { user: safeUser })
})

app.post('/api/bookings', (req, res) => {
    const { userId, itemId, type, amount } = req.body
    if (!userId || !itemId || !type || amount == null) {
        return sendError(res, 'Booking request is missing required fields.')
    }

    const booking = {
        id: getNextId(dataStore.bookings),
        userId,
        itemId,
        type,
        amount,
        date: new Date().toISOString().split('T')[0]
    }

    dataStore.bookings.push(booking)
    sendSuccess(res, { booking })
})

const createResourceHandlers = (basePath, collectionName, itemKey = 'id') => {
    app.post(basePath, (req, res) => {
        const item = req.body
        if (!item) {
            return sendError(res, 'Request body is required.')
        }

        const newItem = { ...item, id: getNextId(dataStore[collectionName]) }
        dataStore[collectionName].push(newItem)
        sendSuccess(res, { [collectionName.slice(0, -1)]: newItem })
    })

    app.put(`${basePath}/:${itemKey}`, (req, res) => {
        const id = Number(req.params[itemKey])
        const updates = req.body
        const index = dataStore[collectionName].findIndex((item) => item.id === id)
        if (index === -1) {
            return sendError(res, `${collectionName.slice(0, -1)} not found.`, 404)
        }

        dataStore[collectionName][index] = { ...dataStore[collectionName][index], ...updates }
        sendSuccess(res, { [collectionName.slice(0, -1)]: dataStore[collectionName][index] })
    })

    app.delete(`${basePath}/:${itemKey}`, (req, res) => {
        const id = Number(req.params[itemKey])
        const index = dataStore[collectionName].findIndex((item) => item.id === id)
        if (index === -1) {
            return sendError(res, `${collectionName.slice(0, -1)} not found.`, 404)
        }

        dataStore[collectionName].splice(index, 1)
        sendSuccess(res)
    })
}

createResourceHandlers('/api/homestays', 'homestays')
createResourceHandlers('/api/tourist-places', 'touristPlaces')
createResourceHandlers('/api/guides', 'guides')

app.delete('/api/users/:id', (req, res) => {
    const id = Number(req.params.id)
    const index = dataStore.users.findIndex((user) => user.id === id)
    if (index === -1) {
        return sendError(res, 'User not found.', 404)
    }

    dataStore.users.splice(index, 1)
    sendSuccess(res)
})

app.put('/api/users/:id/role', (req, res) => {
    const id = Number(req.params.id)
    const { role } = req.body
    const user = dataStore.users.find((u) => u.id === id)
    if (!user) {
        return sendError(res, 'User not found.', 404)
    }

    if (!role) {
        return sendError(res, 'Role is required.')
    }

    user.role = role
    const safeUser = { ...user }
    delete safeUser.password
    sendSuccess(res, { user: safeUser })
})

const distPath = path.join(__dirname, 'dist')
const indexFile = path.join(distPath, 'index.html')
const hasDist = fs.existsSync(indexFile)

if (hasDist) {
    app.use(express.static(distPath))
    app.get('*', (_req, res) => {
        res.sendFile(indexFile)
    })
} else {
    app.get('*', (_req, res) => {
        res.status(404).send('Front-end build not found. Run npm run build and redeploy.')
    })
}

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
})
