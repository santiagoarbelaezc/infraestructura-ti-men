CREATE TABLE IF NOT EXISTS instituciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    municipio VARCHAR(100),
    departamento VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO instituciones (nombre, municipio, departamento) VALUES
('Colegio Nacional Bogotá', 'Bogotá', 'Cundinamarca'),
('IED Simón Bolívar', 'Medellín', 'Antioquia'),
('Instituto Técnico Industrial', 'Cali', 'Valle del Cauca');
