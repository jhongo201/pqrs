# HU-009: Gestión de Usuarios

## Descripción
**Como** administrador del sistema  
**Quiero** poder crear, actualizar y desactivar usuarios  
**Para** controlar quién tiene acceso al sistema y qué acciones puede realizar

## Criterios de Aceptación

1. **Dado que** soy un administrador del sistema  
   **Cuando** accedo al módulo de gestión de usuarios  
   **Entonces** el sistema debe mostrar una lista de todos los usuarios registrados con opciones para crear, editar y desactivar

2. **Dado que** estoy en el módulo de gestión de usuarios  
   **Cuando** selecciono la opción de crear un nuevo usuario  
   **Entonces** el sistema debe mostrar un formulario con los campos necesarios para registrar un usuario

3. **Dado que** estoy creando un nuevo usuario  
   **Cuando** ingreso la información requerida (nombre, apellidos, tipo y número de documento, correo, teléfono, nombre de usuario, rol)  
   **Entonces** el sistema debe validar que todos los campos obligatorios estén completos y con formato correcto

4. **Dado que** estoy creando un nuevo usuario  
   **Cuando** ingreso un nombre de usuario o correo electrónico que ya existe  
   **Entonces** el sistema debe mostrar un mensaje de error indicando que el usuario o correo ya está registrado

5. **Dado que** he completado correctamente el formulario de creación de usuario  
   **Cuando** guardo la información  
   **Entonces** el sistema debe:
   - Crear el usuario con estado activo
   - Generar una contraseña temporal
   - Enviar un correo de activación al usuario
   - Mostrar un mensaje de confirmación

6. **Dado que** estoy en el módulo de gestión de usuarios  
   **Cuando** selecciono la opción de editar un usuario existente  
   **Entonces** el sistema debe mostrar un formulario con la información actual del usuario y permitir su modificación

7. **Dado que** estoy editando un usuario  
   **Cuando** actualizo su información y guardo los cambios  
   **Entonces** el sistema debe actualizar los datos del usuario y mostrar un mensaje de confirmación

8. **Dado que** estoy en el módulo de gestión de usuarios  
   **Cuando** selecciono la opción de desactivar un usuario  
   **Entonces** el sistema debe solicitar confirmación y, al confirmar, cambiar el estado del usuario a inactivo

9. **Dado que** estoy en el módulo de gestión de usuarios  
   **Cuando** selecciono la opción de activar un usuario inactivo  
   **Entonces** el sistema debe cambiar el estado del usuario a activo y enviar una notificación

## Definición Técnica

### Endpoints

#### Listar Usuarios
```
GET /api/usuarios
```

#### Crear Usuario
```
POST /api/usuarios
```

#### Payload de Creación
```json
{
  "username": "maria.lopez",
  "idRol": 2,
  "persona": {
    "nombres": "María",
    "apellidos": "López Gómez",
    "tipoDocumento": "CC",
    "numeroDocumento": "1098765432",
    "email": "maria.lopez@example.com",
    "telefono": "3157894561"
  },
  "idArea": 3
}
```

#### Obtener Usuario por ID
```
GET /api/usuarios/{id}
```

#### Actualizar Usuario
```
PUT /api/usuarios/{id}
```

#### Cambiar Estado de Usuario
```
PUT /api/usuarios/{id}/estado/{nuevoEstado}
```

### Respuesta Exitosa (Creación/Actualización)
```json
{
  "idUsuario": 6,
  "username": "maria.lopez",
  "estado": true,
  "fechaCreacion": "2025-05-25T10:00:00",
  "ultimoLogin": null,
  "rol": {
    "idRol": 2,
    "nombre": "Funcionario",
    "descripcion": "Funcionario con acceso a gestión de PQRS"
  },
  "persona": {
    "idPersona": 8,
    "nombres": "María",
    "apellidos": "López Gómez",
    "nombreCompleto": "María López Gómez",
    "tipoDocumento": "CC",
    "numeroDocumento": "1098765432",
    "email": "maria.lopez@example.com",
    "telefono": "3157894561"
  },
  "area": {
    "idArea": 3,
    "nombre": "Servicio al Cliente"
  }
}
```

## Mockup de Interfaz

### Lista de Usuarios
```
+-------------------------------------------------------+
|                  GESTIÓN DE USUARIOS                  |
+-------------------------------------------------------+
| [+ Nuevo Usuario]                                     |
|                                                       |
| Filtrar: [                  ] [   Buscar   ]          |
|                                                       |
| +---------------------------------------------------+ |
| | Usuario  | Nombre Completo | Rol        | Estado  | |
| +---------------------------------------------------+ |
| | admin    | Administrador   | Admin      | Activo  | |
| | Sistema  |                 |            |         | |
| |          |                 |            |         | |
| | [Editar] [Desactivar]                             | |
| +---------------------------------------------------+ |
| | pedro.   | Pedro Martínez | Funcionario| Activo   | |
| | martinez |                |            |          | |
| |          |                |            |          | |
| | [Editar] [Desactivar]                             | |
| +---------------------------------------------------+ |
| | ana.     | Ana Gómez      | Coordinador| Activo   | |
| | gomez    |                |            |          | |
| |          |                |            |          | |
| | [Editar] [Desactivar]                             | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Creación/Edición de Usuario
```
+-------------------------------------------------------+
|                  CREAR NUEVO USUARIO                  |
+-------------------------------------------------------+
| DATOS PERSONALES                                      |
|                                                       |
| Nombres*: [                                   ]       |
| Apellidos*: [                                 ]       |
|                                                       |
| Tipo de Documento*:  [▼ Seleccione               ]    |
| Número de Documento*: [                        ]      |
|                                                       |
| Correo Electrónico*: [                         ]      |
| Teléfono*: [                                   ]      |
|                                                       |
| DATOS DE ACCESO                                       |
|                                                       |
| Nombre de Usuario*: [                          ]      |
| Rol*: [▼ Seleccione                           ]       |
| Área*: [▼ Seleccione                          ]       |
|                                                       |
| [ ] Enviar correo de activación                       |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe validar el formato del correo electrónico y número telefónico
- El nombre de usuario debe ser único en el sistema
- El correo electrónico debe ser único en el sistema
- La contraseña temporal generada debe cumplir con políticas de seguridad (mínimo 8 caracteres, incluir mayúsculas, minúsculas, números y caracteres especiales)
- El correo de activación debe incluir un enlace para que el usuario establezca su contraseña
- El enlace de activación debe tener una validez limitada (por ejemplo, 24 horas)
- Solo los usuarios con rol de Administrador pueden gestionar usuarios
- El sistema debe mantener un registro de auditoría de las acciones realizadas en la gestión de usuarios
