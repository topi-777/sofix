-- Crear la Base de Datos
CREATE DATABASE optica_db;
USE optica_db;

-- Tabla de Usuarios (Registro)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Debe almacenarse hasheada en un entorno real
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos (Catálogo)
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 10,
    imagen_url VARCHAR(255)
);

-- Insertar productos de ejemplo
INSERT INTO productos (nombre, descripcion, precio, stock, imagen_url) VALUES
('Gafas de Sol Clásicas', 'Protección UV 100% y diseño elegante.', 45.00, 15, 'https://images.unsplash.com/photo-1574258495973-f010dfbb5371'),
('Montura Moderna', 'Ligeras y resistentes para el día a día.', 60.00, 20, 'https://images.unsplash.com/photo-1591076482161-42ce6da69f67'),
('Lentes Anti-luz Azul', 'Ideales para trabajo frente a pantallas.', 75.00, 10, 'https://images.unsplash.com/photo-1508296695146-257a814070b4');

-- Tabla de Pedidos (Compras)
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabla de Detalle del Pedido (Productos comprados en cada orden)
CREATE TABLE detalle_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);