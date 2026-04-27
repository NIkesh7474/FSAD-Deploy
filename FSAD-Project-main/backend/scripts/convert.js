import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const mockDataPath = join(__dirname, '..', '..', 'src', 'data', 'mockData.js');
const mockDataContent = readFileSync(mockDataPath, 'utf-8');

// Remove export and make it a valid JS object
let dataStr = mockDataContent.replace('export const mockData = ', '').trim();
if (dataStr.endsWith(';')) dataStr = dataStr.slice(0, -1);

// Eval the JS object
const mockData = eval(`(${dataStr})`);

console.log(JSON.stringify(mockData, null, 2));