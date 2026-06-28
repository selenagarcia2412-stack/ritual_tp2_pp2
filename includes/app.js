const { createApp } = Vue;

// Componente reutilizable para cada producto (estilo card)
const ProductCard = {
    props: ['producto'],
    template: `
        <div class="card-ritual">
            <img :src="'../' + producto.foto" :alt="producto.nombre">
            <div class="card-body">
                <span class="marca">{{ producto.marca }}</span>
                <h4 class="card-title">{{ producto.nombre }}</h4>
                <p class="precio">$ {{ producto.precio }}</p>

                <a :href="'detalle.html?id=' + producto.id_producto" class="btn-glass">Ver más</a>
            </div>
        </div>
    `,
    data() {
        return {
            verInfo: false
        }
    }
};

// Instancia principal de Vue
const app = createApp({
    components: {
        'product-card': ProductCard
    },
    created() {
        this.getProductos();
    },
    data() {
        return {
            productos: []
        }
    },
    methods: {
        async getProductos() {
            const res = await fetch('getProductos.php');
            const datos = await res.json();
            this.productos = datos;
            console.log(datos);
        }
    }
}).mount('#app');