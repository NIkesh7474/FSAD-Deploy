import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import mysql from 'mysql2/promise';
import path from 'path';
import { fileURLToPath } from 'url';
import { mockData as sharedMockData } from './src/data/mockData.js';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'tourism_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
};

let pool;
let useMockData = false;

const mockData = sharedMockData;

const initialUsers = [
    { name: 'Alice Admin', email: 'admin@test.com', password: 'password', role: 'admin', phone: '', address: 'Admin Office' },
    { name: 'Bob User', email: 'user@test.com', password: 'password', role: 'user', phone: '+91-9876543210', address: 'Mumbai, India' },
    { name: 'Ravi Shankar', email: 'guide@test.com', password: 'password', role: 'guide', phone: '+91-9876543210', address: 'Delhi, India' }
];

const seedUsers = initialUsers;
let users = [...initialUsers];

const query = async (sql, params = []) => {
    if (!pool) {
        throw new Error('Database is not initialized');
    }
    const [rows] = await pool.query(sql, params);
    return rows;
};

const initializeDatabase = async () => {
    pool = mysql.createPool(dbConfig);
    const connection = await pool.getConnection();
    try {
        await connection.query("CREATE DATABASE IF NOT EXISTS `" + dbConfig.database + "` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
        await connection.query("USE `" + dbConfig.database + "`");

        await connection.query(`CREATE TABLE IF NOT EXISTS homestays (
            id BIGINT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255),
            description TEXT,
            lat DOUBLE,
            lng DOUBLE,
            amount DOUBLE,
            rooms INT,
            category VARCHAR(255),
            location VARCHAR(255)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);

        await connection.query(`CREATE TABLE IF NOT EXISTS tourist_places (
            id BIGINT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255),
            description TEXT,
            lat DOUBLE,
            lng DOUBLE,
            amount DOUBLE,
            location VARCHAR(255)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);

        await connection.query(`CREATE TABLE IF NOT EXISTS guides (
            id BIGINT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255),
            qualification VARCHAR(255),
            experience VARCHAR(255),
            amount DOUBLE,
            contact VARCHAR(255),
            location VARCHAR(255)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);

        await connection.query(`CREATE TABLE IF NOT EXISTS users (
            id BIGINT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255),
            email VARCHAR(255),
            password VARCHAR(255),
            role VARCHAR(50),
            phone VARCHAR(50),
            address VARCHAR(255)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);
        const [phoneColumns] = await connection.query("SHOW COLUMNS FROM users LIKE 'phone'");
        if (phoneColumns.length === 0) {
            await connection.query("ALTER TABLE users ADD COLUMN phone VARCHAR(50)");
        }
        const [addressColumns] = await connection.query("SHOW COLUMNS FROM users LIKE 'address'");
        if (addressColumns.length === 0) {
            await connection.query("ALTER TABLE users ADD COLUMN address VARCHAR(255)");
        }

        await connection.query(`CREATE TABLE IF NOT EXISTS bookings (
            id BIGINT PRIMARY KEY AUTO_INCREMENT,
            user_id BIGINT,
            item_id BIGINT,
            type VARCHAR(255),
            amount DOUBLE,
            date DATE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);

        const [homestayCount] = await connection.query('SELECT COUNT(*) AS count FROM homestays');
        const [touristPlaceCount] = await connection.query('SELECT COUNT(*) AS count FROM tourist_places');
        const [guideCount] = await connection.query('SELECT COUNT(*) AS count FROM guides');
        const [userCount] = await connection.query('SELECT COUNT(*) AS count FROM users');

        const recordExists = async (table, columns, values) => {
            const whereSql = columns.map(col => `${col} = ?`).join(' AND ');
            const [rows] = await connection.query(`SELECT id FROM ${table} WHERE ${whereSql} LIMIT 1`, values);
            return rows.length > 0;
        };

        if (userCount[0].count > 0) {
            await connection.query('DELETE FROM users');
            await connection.query('ALTER TABLE users AUTO_INCREMENT = 1');
        }

        if (homestayCount[0].count === 0) {
            const homestays = mockData.homestays.map(h => [h.name, h.description, h.lat, h.lng, h.amount, h.rooms, h.category, h.location]);
            await connection.query(`INSERT INTO homestays (name, description, lat, lng, amount, rooms, category, location) VALUES ?`, [homestays]);
        } else {
            for (const h of mockData.homestays) {
                if (!await recordExists('homestays', ['name', 'location'], [h.name, h.location])) {
                    await connection.query('INSERT INTO homestays (name, description, lat, lng, amount, rooms, category, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', [h.name, h.description, h.lat, h.lng, h.amount, h.rooms, h.category, h.location]);
                }
            }
        }

        if (touristPlaceCount[0].count === 0) {
            const places = mockData.touristPlaces.map(t => [t.name, t.description, t.lat, t.lng, t.amount, t.location]);
            await connection.query(`INSERT INTO tourist_places (name, description, lat, lng, amount, location) VALUES ?`, [places]);
        } else {
            for (const t of mockData.touristPlaces) {
                if (!await recordExists('tourist_places', ['name', 'location'], [t.name, t.location])) {
                    await connection.query('INSERT INTO tourist_places (name, description, lat, lng, amount, location) VALUES (?, ?, ?, ?, ?, ?)', [t.name, t.description, t.lat, t.lng, t.amount, t.location]);
                }
            }
        }

        if (guideCount[0].count === 0) {
            const guides = mockData.guides.map(g => [g.name, g.qualification, g.experience, g.amount, g.contact, g.location]);
            await connection.query(`INSERT INTO guides (name, qualification, experience, amount, contact, location) VALUES ?`, [guides]);
        } else {
            for (const g of mockData.guides) {
                if (!await recordExists('guides', ['name', 'location'], [g.name, g.location])) {
                    await connection.query('INSERT INTO guides (name, qualification, experience, amount, contact, location) VALUES (?, ?, ?, ?, ?, ?)', [g.name, g.qualification, g.experience, g.amount, g.contact, g.location]);
                }
            }
        }

        const usersSeed = seedUsers.map(u => [u.name, u.email, u.password, u.role, u.phone || '', u.address || '']);
        await connection.query(`INSERT INTO users (name, email, password, role, phone, address) VALUES ?`, [usersSeed]);

        const [bookingCount] = await connection.query('SELECT COUNT(*) AS count FROM bookings');
        if (bookingCount[0].count === 0) {
            const [seedUsersRows] = await connection.query('SELECT id FROM users ORDER BY id LIMIT 2');
            const [seedHomestays] = await connection.query('SELECT id FROM homestays ORDER BY id LIMIT 2');
            const [seedPlaces] = await connection.query('SELECT id FROM tourist_places ORDER BY id LIMIT 2');
            if (seedUsersRows.length && seedHomestays.length && seedPlaces.length) {
                const bookings = [
                    [seedUsersRows[0].id, seedHomestays[0].id, 'homestay', 2000, '2025-01-01'],
                    [seedUsersRows[0].id, seedPlaces[0].id, 'tourist_place', 1500, '2025-02-15'],
                    [seedUsersRows[1]?.id || seedUsersRows[0].id, seedHomestays[1]?.id || seedHomestays[0].id, 'homestay', 2400, '2025-03-05']
                ];
                await connection.query('INSERT INTO bookings (user_id, item_id, type, amount, date) VALUES ?', [bookings]);
            }
        }

        console.log('MySQL database initialized and seeded.');
    } finally {
        connection.release();
    }
};

initializeDatabase().catch((error) => {
    console.error('Failed to initialize MySQL database. Falling back to mock data:', error.message);
    console.error('Set DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, and DB_NAME in a .env file or environment variables to enable MySQL persistence.');
    useMockData = true;
});

const getDatabaseValue = async (sql, params = []) => {
    if (useMockData) {
        throw new Error('Database not available');
    }
    return query(sql, params);
};

app.get('/api/homestays', async (req, res) => {
    const { location } = req.query;
    try {
        if (useMockData) throw new Error('fallback');
        let sql = 'SELECT * FROM homestays';
        const params = [];
        if (location) {
            sql += ' WHERE LOWER(location) LIKE ? OR LOWER(name) LIKE ?';
            params.push(`%${location.toLowerCase()}%`, `%${location.toLowerCase()}%`);
        }
        const rows = await query(sql, params);
        res.json(rows);
    } catch (error) {
        if (useMockData) {
            const filtered = location ? mockData.homestays.filter(h => h.location.toLowerCase().includes(location.toLowerCase()) || h.name.toLowerCase().includes(location.toLowerCase())) : mockData.homestays;
            res.json(filtered);
        } else {
            res.status(500).json({ message: error.message });
        }
    }
});

app.get('/api/tourist-places', async (req, res) => {
    const { location } = req.query;
    try {
        if (useMockData) throw new Error('fallback');
        let sql = 'SELECT * FROM tourist_places';
        const params = [];
        if (location) {
            sql += ' WHERE LOWER(location) LIKE ? OR LOWER(name) LIKE ?';
            params.push(`%${location.toLowerCase()}%`, `%${location.toLowerCase()}%`);
        }
        const rows = await query(sql, params);
        res.json(rows);
    } catch (error) {
        if (useMockData) {
            const filtered = location ? mockData.touristPlaces.filter(t => t.location.toLowerCase().includes(location.toLowerCase()) || t.name.toLowerCase().includes(location.toLowerCase())) : mockData.touristPlaces;
            res.json(filtered);
        } else {
            res.status(500).json({ message: error.message });
        }
    }
});

app.get('/api/guides', async (req, res) => {
    try {
        if (useMockData) throw new Error('fallback');
        const rows = await query('SELECT * FROM guides');
        res.json(rows);
    } catch (error) {
        if (useMockData) {
            res.json(mockData.guides);
        } else {
            res.status(500).json({ message: error.message });
        }
    }
});

app.post('/api/bookings', async (req, res) => {
    const { userId, itemId, type, amount } = req.body;
    try {
        if (useMockData) throw new Error('fallback');
        const result = await query('INSERT INTO bookings (user_id, item_id, type, amount, date) VALUES (?, ?, ?, ?, ?)', [userId, itemId, type, amount, new Date().toISOString().split('T')[0]]);
        res.json({ success: true, booking: { id: result.insertId, userId, itemId, type, amount, date: new Date().toISOString().split('T')[0] } });
    } catch (error) {
        if (useMockData) {
            const newBooking = { id: Date.now(), userId, itemId, type, amount, date: new Date().toISOString().split('T')[0] };
            res.json({ success: true, booking: newBooking });
        } else {
            res.status(500).json({ success: false, message: error.message });
        }
    }
});

app.get('/api/users', async (req, res) => {
    try {
        if (useMockData) throw new Error('fallback');
        const rows = await query('SELECT * FROM users');
        res.json(rows);
    } catch (error) {
        if (useMockData) {
            res.json(users);
        } else {
            res.status(500).json({ message: error.message });
        }
    }
});

app.put('/api/users/:id/role', async (req, res) => {
    const id = Number(req.params.id);
    const { role } = req.body;
    try {
        if (useMockData) throw new Error('fallback');
        await query('UPDATE users SET role = ? WHERE id = ?', [role, id]);
        const rows = await query('SELECT * FROM users WHERE id = ?', [id]);
        res.json({ success: true, user: rows[0] });
    } catch (error) {
        if (useMockData) {
            const index = users.findIndex(u => u.id === id);
            if (index !== -1) {
                users[index].role = role;
                res.json({ success: true, user: users[index] });
                return;
            }
            res.status(404).json({ success: false, message: 'User not found' });
        } else {
            res.status(500).json({ success: false, message: error.message });
        }
    }
});

app.delete('/api/users/:id', async (req, res) => {
    const id = Number(req.params.id);
    try {
        if (useMockData) throw new Error('fallback');
        await query('DELETE FROM users WHERE id = ?', [id]);
        res.json({ success: true });
    } catch (error) {
        if (useMockData) {
            users = users.filter(u => u.id !== id);
            res.json({ success: true });
        } else {
            res.status(500).json({ success: false, message: error.message });
        }
    }
});

app.post('/api/auth/login', async (req, res) => {
    const { identifier, password } = req.body;
    try {
        if (useMockData) throw new Error('fallback');
        const rows = await query('SELECT * FROM users WHERE (email = ? OR name = ?) AND password = ? LIMIT 1', [identifier, identifier, password]);
        if (rows.length > 0) {
            res.json({ success: true, user: rows[0] });
        } else {
            res.json({ success: false, message: 'Invalid username/email or password' });
        }
    } catch (error) {
        if (useMockData) {
            const user = users.find(u => (u.email === identifier || u.name === identifier) && u.password === password);
            if (user) {
                res.json({ success: true, user });
            } else {
                res.json({ success: false, message: 'Invalid username/email or password' });
            }
        } else {
            res.status(500).json({ success: false, message: error.message });
        }
    }
});

app.post('/api/auth/register', async (req, res) => {
    const { name, email, password, role, phone, address } = req.body;
    try {
        if (useMockData) throw new Error('fallback');
        const result = await query('INSERT INTO users (name, email, password, role, phone, address) VALUES (?, ?, ?, ?, ?, ?)', [name, email, password, role || 'user', phone || '', address || '']);
        const rows = await query('SELECT * FROM users WHERE id = ?', [result.insertId]);
        res.json({ success: true, user: rows[0] });
    } catch (error) {
        console.error('Register error:', error.stack || error);
        if (useMockData) {
            const newUser = { id: Date.now(), name, email, password, role: role || 'user', phone: phone || '' };
            users.push(newUser);
            res.json({ success: true, user: newUser });
        } else {
            res.status(500).json({ success: false, message: error.message, stack: error.stack });
        }
    }
});

app.use(express.static(path.join(__dirname, 'dist')));

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});