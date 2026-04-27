import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const mockDataPath = join(__dirname, 'src', 'data', 'mockData.js');
const mockDataContent = readFileSync(mockDataPath, 'utf-8');

// Remove export and make it a valid JS object
let dataStr = mockDataContent.replace('export const mockData = ', '').trim();
if (dataStr.endsWith(';')) dataStr = dataStr.slice(0, -1);

// Since it's JS, we can eval it safely as it's our code
const mockData = eval(`(${dataStr})`);

const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
};

async function seedDatabase() {
  const connection = await mysql.createConnection(dbConfig);

  try {
    console.log('Seeding database...');

    // Clear existing data
    await connection.execute('DELETE FROM bookings');
    await connection.execute('DELETE FROM homestays');
    await connection.execute('DELETE FROM tourist_places');
    await connection.execute('DELETE FROM guides');
    await connection.execute('DELETE FROM users');

    // Insert users
    const users = [
      { name: 'Alice Admin', email: 'admin@test.com', password: 'password', role: 'admin' },
      { name: 'Bob User', email: 'user@test.com', password: 'password', role: 'user' },
      { name: 'Ravi Shankar', email: 'guide@test.com', password: 'password', role: 'guide' },
      // Add more users if needed
    ];

    for (const user of users) {
      await connection.execute(
        'INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)',
        [user.name, user.email, user.password, user.role]
      );
    }

    // Insert homestays
    for (const h of mockData.homestays) {
      await connection.execute(
        'INSERT INTO homestays (name, description, lat, lng, amount, rooms, category, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [h.name, h.description, h.lat, h.lng, h.amount, h.rooms, h.category, h.location]
      );
    }

    // Insert tourist places
    for (const tp of mockData.touristPlaces) {
      await connection.execute(
        'INSERT INTO tourist_places (name, description, lat, lng, amount, location) VALUES (?, ?, ?, ?, ?, ?)',
        [tp.name, tp.description, tp.lat, tp.lng, tp.amount, tp.location]
      );
    }

    // Insert guides
    for (const g of mockData.guides) {
      await connection.execute(
        'INSERT INTO guides (name, qualification, experience, amount, contact, location) VALUES (?, ?, ?, ?, ?, ?)',
        [g.name, g.qualification, g.experience, g.amount, g.contact, g.location]
      );
    }

    // Insert sample bookings
    const bookings = [
      { userId: 1, itemId: 1, type: 'homestay', amount: 4500, date: '2024-10-01' },
      { userId: 2, itemId: 2, type: 'homestay', amount: 2500, date: '2024-10-02' },
      { userId: 1, itemId: 1, type: 'tourist_place', amount: 1500, date: '2024-10-03' },
      { userId: 2, itemId: 3, type: 'tourist_place', amount: 2000, date: '2024-10-04' },
      { userId: 1, itemId: 1, type: 'guide', amount: 1500, date: '2024-10-05' },
      { userId: 2, itemId: 2, type: 'guide', amount: 2200, date: '2024-10-06' },
      { userId: 3, itemId: 3, type: 'homestay', amount: 4800, date: '2024-10-07' },
      { userId: 4, itemId: 4, type: 'homestay', amount: 3200, date: '2024-10-08' },
      { userId: 3, itemId: 5, type: 'tourist_place', amount: 1000, date: '2024-10-09' },
      { userId: 4, itemId: 6, type: 'tourist_place', amount: 1100, date: '2024-10-10' },
    ];

    for (const b of bookings) {
      await connection.execute(
        'INSERT INTO bookings (userId, itemId, type, amount, date) VALUES (?, ?, ?, ?, ?)',
        [b.userId, b.itemId, b.type, b.amount, b.date]
      );
    }

    console.log('Database seeded successfully!');
  } catch (error) {
    console.error('Error seeding database:', error);
  } finally {
    await connection.end();
  }
}

seedDatabase();