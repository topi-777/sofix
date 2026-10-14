// Arreglo para almacenar los productos del carrito
let carrito = [];

function agregarAlCarrito(nombre, precio) {
    carrito.push({ nombre, precio });
    actualizarCarrito();
    alert(`¡"${nombre}" ha sido agregado al carrito!`);
}

function actualizarCarrito() {
    const cartCount = document.getElementById('cart-count');
    const cartItems = document.getElementById('cart-items');
    const cartTotalPrice = document.getElementById('cart-total-price');

    cartCount.textContent = carrito.length

    if (carrito.length === 0) {
        cartItems.innerHTML = '<li>El carrito está vacío.</li>';
        cartTotalPrice.textContent = '0.00';
        return;
    }

    cartItems.innerHTML = '';
    let total = 0;

    carrito.forEach((item, index) => {
        total += item.price;
        const li = document.createElement('li');
        li.innerHTML = `
            <span>${item.nombre}</span>
            <span>$${item.precio.toFixed(2)}</span>
        `;
        cartItems.appendChild(li);
    });

    cartTotalPrice.textContent = total.toFixed(2);
}

// Simulación de registro de usuario
function registrarUsuario(event) {
    event.preventDefault();
    
    const nombre = document.getElementById('nombre').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Aquí se conectaría normalmente con un backend (Node.js, PHP, Python) que procesa SQL
    const mensaje = document.getElementById('register-message');
    mensaje.textContent = `¡Registro exitoso, ${nombre}! Bienvenido a Óptica Visión Clara.`;

    // Limpiar formulario
    document.getElementById('register-form').reset();
}

// Simulación de compra
function realizarCompra() {
    if (carrito.length === 0) {
        alert('Tu carrito está vacío. Agrega productos antes de comprar.');
        return;
    }

    alert('¡Compra realizada con éxito! Gracias por tu preferencia. Te enviaremos los detalles a tu correo.');
    carrito = [];
    actualizarCarrito();
}