module starter::juan {
    use std::debug::print;
    use std::string::{String, utf8};
    // Esto es un comentario
    public struct Usuario has drop {
        nombre: String,
        edad: u8,
        vivo: bool,
    }

    fun practica(usuario: Usuario) {
        if(usuario.edad > 18) {
            print(&utf8(b"Acceso permitido"));
            print(&utf8(b"Acceso permitido"));
            print(&utf8(b"Acceso permitido"));
        } else if(usuario.edad == 18) {
            print(&utf8(b"Felicidades!"));
        } else {
            print(&utf8(b"Acceso NO permitido"));
        }
    }

    #[test]
    fun prueba() {
        let usuario = Usuario {
            nombre: utf8(b"Juan Sanchez"),
            edad: 18,
            vivo: true,
        };

        practica(usuario);
    }
}