import json
import re
from pathlib import Path
import subprocess

source_path = Path(__file__).resolve().parent.parent.parent / 'src' / 'data' / 'mockData.js'
output_path = Path(__file__).resolve().parent.parent / 'src' / 'main' / 'resources' / 'db' / 'tourism_db_full_data.sql'

# Use node to convert JS to JSON
result = subprocess.run(['node', str(Path(__file__).parent / 'convert.js')], capture_output=True, text=True)
if result.returncode != 0:
    print('Error running convert.js:', result.stderr)
    exit(1)
obj = json.loads(result.stdout)

lines = []
lines.append('-- Full tourism_db seed for all project data')
lines.append('CREATE DATABASE IF NOT EXISTS `tourism_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
lines.append('USE `tourism_db`;')
lines.append('')
lines.append('CREATE TABLE IF NOT EXISTS `users` (')
lines.append('  `id` BIGINT NOT NULL AUTO_INCREMENT,')
lines.append('  `name` VARCHAR(255),')
lines.append('  `email` VARCHAR(255),')
lines.append('  `password` VARCHAR(255),')
lines.append('  `role` VARCHAR(255),')
lines.append('  PRIMARY KEY (`id`)')
lines.append(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
lines.append('CREATE TABLE IF NOT EXISTS `homestays` (')
lines.append('  `id` BIGINT NOT NULL AUTO_INCREMENT,')
lines.append('  `name` VARCHAR(255),')
lines.append('  `description` TEXT,')
lines.append('  `lat` DOUBLE,')
lines.append('  `lng` DOUBLE,')
lines.append('  `amount` DOUBLE,')
lines.append('  `rooms` INT,')
lines.append('  `category` VARCHAR(255),')
lines.append('  `location` VARCHAR(255),')
lines.append('  PRIMARY KEY (`id`)')
lines.append(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
lines.append('CREATE TABLE IF NOT EXISTS `tourist_places` (')
lines.append('  `id` BIGINT NOT NULL AUTO_INCREMENT,')
lines.append('  `name` VARCHAR(255),')
lines.append('  `description` TEXT,')
lines.append('  `lat` DOUBLE,')
lines.append('  `lng` DOUBLE,')
lines.append('  `amount` DOUBLE,')
lines.append('  `location` VARCHAR(255),')
lines.append('  PRIMARY KEY (`id`)')
lines.append(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
lines.append('CREATE TABLE IF NOT EXISTS `guides` (')
lines.append('  `id` BIGINT NOT NULL AUTO_INCREMENT,')
lines.append('  `name` VARCHAR(255),')
lines.append('  `qualification` VARCHAR(255),')
lines.append('  `experience` VARCHAR(255),')
lines.append('  `amount` DOUBLE,')
lines.append('  `contact` VARCHAR(255),')
lines.append('  `location` VARCHAR(255),')
lines.append('  PRIMARY KEY (`id`)')
lines.append(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
lines.append('CREATE TABLE IF NOT EXISTS `bookings` (')
lines.append('  `id` BIGINT NOT NULL AUTO_INCREMENT,')
lines.append('  `userId` BIGINT,')
lines.append('  `itemId` BIGINT,')
lines.append('  `type` VARCHAR(255),')
lines.append('  `amount` DOUBLE,')
lines.append('  `date` VARCHAR(255),')
lines.append('  PRIMARY KEY (`id`)')
lines.append(') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;')
lines.append('')

users = [
    {'name':'Alice Admin','email':'admin@test.com','password':'password','role':'admin'},
    {'name':'Bob User','email':'user@test.com','password':'password','role':'user'},
    {'name':'Ravi Shankar','email':'guide@test.com','password':'password','role':'guide'},
]

def quote(value):
    if value is None:
        return 'NULL'
    if isinstance(value, bool):
        return 'TRUE' if value else 'FALSE'
    if isinstance(value, (int, float)):
        return str(value)
    return "'" + str(value).replace("'", "''") + "'"

for u in users:
    cols = ', '.join(f'`{k}`' for k in u)
    vals = ', '.join(quote(v) for v in u.values())
    lines.append(f'INSERT INTO `users` ({cols}) VALUES ({vals});')
lines.append('')
for h in obj['homestays']:
    data = {k: h[k] for k in ['name','description','lat','lng','amount','rooms','category','location']}
    cols = ', '.join(f'`{k}`' for k in data)
    vals = ', '.join(quote(v) for v in data.values())
    lines.append(f'INSERT INTO `homestays` ({cols}) VALUES ({vals});')
lines.append('')
for p in obj['touristPlaces']:
    data = {k: p[k] for k in ['name','description','lat','lng','amount','location']}
    cols = ', '.join(f'`{k}`' for k in data)
    vals = ', '.join(quote(v) for v in data.values())
    lines.append(f'INSERT INTO `tourist_places` ({cols}) VALUES ({vals});')
lines.append('')
for g in obj['guides']:
    data = {k: g[k] for k in ['name','qualification','experience','amount','contact','location']}
    cols = ', '.join(f'`{k}`' for k in data)
    vals = ', '.join(quote(v) for v in data.values())
    lines.append(f'INSERT INTO `guides` ({cols}) VALUES ({vals});')

output_path.parent.mkdir(parents=True, exist_ok=True)
output_path.write_text('\n'.join(lines) + '\n', encoding='utf-8')
print(f'Created SQL seed file at {output_path}')
