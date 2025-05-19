# HU-010: Asignación de Roles

## Descripción
**Como** administrador del sistema  
**Quiero** poder asignar roles a los usuarios  
**Para** definir sus niveles de acceso y responsabilidades en el sistema

## Criterios de Aceptación

1. **Dado que** soy un administrador del sistema  
   **Cuando** accedo al módulo de gestión de roles  
   **Entonces** el sistema debe mostrar una lista de todos los roles disponibles con opciones para crear, editar y desactivar

2. **Dado que** estoy en el módulo de gestión de roles  
   **Cuando** selecciono la opción de crear un nuevo rol  
   **Entonces** el sistema debe mostrar un formulario con los campos necesarios para definir un rol

3. **Dado que** estoy creando un nuevo rol  
   **Cuando** ingreso el nombre y descripción del rol  
   **Entonces** el sistema debe validar que el nombre del rol sea único

4. **Dado que** he creado un nuevo rol  
   **Cuando** deseo configurar sus permisos  
   **Entonces** el sistema debe permitirme seleccionar las rutas y operaciones permitidas para ese rol

5. **Dado que** estoy en el módulo de gestión de usuarios  
   **Cuando** edito un usuario y cambio su rol  
   **Entonces** el sistema debe actualizar los permisos del usuario según el nuevo rol asignado

6. **Dado que** un usuario tiene un rol asignado  
   **Cuando** ese usuario intenta acceder a una funcionalidad  
   **Entonces** el sistema debe verificar si el rol tiene los permisos necesarios para esa operación

7. **Dado que** estoy en el módulo de gestión de roles  
   **Cuando** selecciono la opción de editar un rol existente  
   **Entonces** el sistema debe mostrar un formulario con la información actual del rol y permitir su modificación

8. **Dado que** estoy editando un rol  
   **Cuando** actualizo sus permisos y guardo los cambios  
   **Entonces** el sistema debe actualizar los permisos para todos los usuarios que tienen ese rol asignado

## Definición Técnica

### Endpoints

#### Listar Roles
```
GET /api/roles
```

#### Crear Rol
```
POST /api/roles
```

#### Payload de Creación
```json
{
  "nombre": "Supervisor",
  "descripcion": "Supervisor con acceso a reportes y estadísticas"
}
```

#### Obtener Rol por ID
```
GET /api/roles/{id}
```

#### Actualizar Rol
```
PUT /api/roles/{id}
```

#### Asignar Permisos a Rol
```
POST /api/permisos-rol
```

#### Payload de Asignación de Permisos
```json
{
  "idRol": 3,
  "idRuta": 5,
  "puedeLeer": true,
  "puedeEscribir": true,
  "puedeActualizar": true,
  "puedeEliminar": false
}
```

### Respuesta Exitosa (Creación/Actualización de Rol)
```json
{
  "idRol": 3,
  "nombre": "Supervisor",
  "descripcion": "Supervisor con acceso a reportes y estadísticas",
  "estado": true,
  "fechaCreacion": "2025-05-26T11:30:00"
}
```

## Mockup de Interfaz

### Lista de Roles
```
+-------------------------------------------------------+
|                  GESTIÓN DE ROLES                     |
+-------------------------------------------------------+
| [+ Nuevo Rol]                                         |
|                                                       |
| +---------------------------------------------------+ |
| | ID | Nombre      | Descripción           | Estado | |
| +---------------------------------------------------+ |
| | 1  | Administrador| Acceso total al sistema| Activo| |
| |    |             |                       |        | |
| |    | [Editar] [Permisos] [Desactivar]              | |
| +---------------------------------------------------+ |
| | 2  | Funcionario | Gestión básica de PQRS| Activo | |
| |    |             |                       |        | |
| |    | [Editar] [Permisos] [Desactivar]              | |
| +---------------------------------------------------+ |
| | 3  | Coordinador | Gestión avanzada y    | Activo | |
| |    |             | reportes              |        | |
| |    | [Editar] [Permisos] [Desactivar]              | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Creación/Edición de Rol
```
+-------------------------------------------------------+
|                  CREAR NUEVO ROL                      |
+-------------------------------------------------------+
|                                                       |
| Nombre*: [                                   ]        |
|                                                       |
| Descripción*: [                              ]        |
|                                                       |
| Estado: [✓] Activo                                    |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

### Configuración de Permisos de Rol
```
+-------------------------------------------------------+
|            CONFIGURAR PERMISOS: SUPERVISOR            |
+-------------------------------------------------------+
|                                                       |
| Módulo: [▼ Todos                             ]        |
|                                                       |
| +---------------------------------------------------+ |
| | Ruta                | Leer | Escr | Act  | Elim  | |
| +---------------------------------------------------+ |
| | /api/pqrs           | [✓]  | [✓]  | [✓]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/pqrs/{id}      | [✓]  | [ ]  | [✓]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/usuarios       | [✓]  | [ ]  | [ ]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/estadisticas   | [✓]  | [ ]  | [ ]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/reportes       | [✓]  | [✓]  | [ ]  | [ ]   | |
| +---------------------------------------------------+ |
|                                                       |
| [✓] Seleccionar todos                                 |
| [ ] Leer  [ ] Escribir  [ ] Actualizar  [ ] Eliminar  |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe tener roles predefinidos como Administrador, Funcionario y Coordinador
- Los permisos se definen a nivel de ruta y operación (Leer, Escribir, Actualizar, Eliminar)
- Cada ruta debe estar asociada a un módulo para facilitar la organización de permisos
- Al crear un nuevo usuario, es obligatorio asignarle un rol
- El cambio de permisos en un rol afecta inmediatamente a todos los usuarios con ese rol
- El sistema debe mantener un registro de auditoría de las modificaciones realizadas a los roles
- Solo los usuarios con rol de Administrador pueden gestionar roles y permisos
- Debe existir al menos un usuario con rol de Administrador en el sistema en todo momento
