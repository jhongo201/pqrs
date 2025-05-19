# HU-013: Gestión de Temas de PQRS

## Descripción
**Como** administrador del sistema  
**Quiero** poder crear y configurar temas de PQRS asociados a áreas específicas  
**Para** categorizar las solicitudes y facilitar su asignación a las áreas correspondientes

## Criterios de Aceptación

1. **Dado que** soy un administrador del sistema  
   **Cuando** accedo al módulo de gestión de temas de PQRS  
   **Entonces** el sistema debe mostrar una lista de todos los temas registrados con opciones para crear, editar y desactivar

2. **Dado que** estoy en el módulo de gestión de temas  
   **Cuando** selecciono la opción de crear un nuevo tema  
   **Entonces** el sistema debe mostrar un formulario con los campos necesarios para registrar un tema

3. **Dado que** estoy creando un nuevo tema  
   **Cuando** ingreso el nombre, descripción y selecciono el área a la que pertenece  
   **Entonces** el sistema debe validar que todos los campos obligatorios estén completos

4. **Dado que** estoy creando un nuevo tema  
   **Cuando** ingreso un nombre de tema que ya existe en la misma área  
   **Entonces** el sistema debe mostrar un mensaje de error indicando que el tema ya está registrado

5. **Dado que** estoy creando un nuevo tema  
   **Cuando** deseo asignar responsables por defecto para este tema  
   **Entonces** el sistema debe permitirme seleccionar uno o más usuarios del área correspondiente

6. **Dado que** he completado correctamente el formulario de creación de tema  
   **Cuando** guardo la información  
   **Entonces** el sistema debe:
   - Crear el tema con estado activo
   - Registrar los responsables asignados
   - Mostrar un mensaje de confirmación
   - Actualizar la lista de temas

7. **Dado que** estoy en el módulo de gestión de temas  
   **Cuando** selecciono la opción de editar un tema existente  
   **Entonces** el sistema debe mostrar un formulario con la información actual del tema y permitir su modificación

8. **Dado que** estoy editando un tema  
   **Cuando** actualizo su información y guardo los cambios  
   **Entonces** el sistema debe actualizar los datos del tema y mostrar un mensaje de confirmación

9. **Dado que** estoy en el módulo de gestión de temas  
   **Cuando** selecciono la opción de desactivar un tema  
   **Entonces** el sistema debe solicitar confirmación y, al confirmar, cambiar el estado del tema a inactivo

## Definición Técnica

### Endpoints

#### Listar Temas
```
GET /api/temas-pqrs
```

#### Listar Temas por Área
```
GET /api/temas-pqrs/area/{idArea}
```

#### Crear Tema
```
POST /api/temas-pqrs
```

#### Payload de Creación
```json
{
  "idArea": 2,
  "nombre": "Certificaciones Laborales",
  "descripcion": "Solicitudes de certificados laborales",
  "responsables": [4, 7]
}
```

#### Obtener Tema por ID
```
GET /api/temas-pqrs/{id}
```

#### Actualizar Tema
```
PUT /api/temas-pqrs/{id}
```

#### Eliminar/Desactivar Tema
```
DELETE /api/temas-pqrs/{id}
```

### Respuesta Exitosa (Creación/Actualización)
```json
{
  "idTema": 5,
  "nombre": "Certificaciones Laborales",
  "descripcion": "Solicitudes de certificados laborales",
  "estado": true,
  "area": {
    "idArea": 2,
    "nombre": "Recursos Humanos",
    "descripcion": "Gestión del talento humano",
    "estado": true
  },
  "responsables": [
    {
      "idUsuario": 4,
      "username": "pedro.martinez",
      "nombreCompleto": "Pedro Martínez",
      "email": "pedro.martinez@example.com"
    },
    {
      "idUsuario": 7,
      "username": "laura.gomez",
      "nombreCompleto": "Laura Gómez",
      "email": "laura.gomez@example.com"
    }
  ]
}
```

## Mockup de Interfaz

### Lista de Temas
```
+-------------------------------------------------------+
|               GESTIÓN DE TEMAS DE PQRS                |
+-------------------------------------------------------+
| [+ Nuevo Tema]                                        |
|                                                       |
| Filtrar por Área: [▼ Todas                   ]        |
|                                                       |
| +---------------------------------------------------+ |
| | ID | Nombre        | Área            | Estado     | |
| +---------------------------------------------------+ |
| | 1  | Información   | Atención al     | Activo     | |
| |    | General       | Ciudadano       |            | |
| |    |               |                 |            | |
| |    | [Editar] [Responsables] [Desactivar]         | |
| +---------------------------------------------------+ |
| | 2  | Quejas y      | Atención al     | Activo     | |
| |    | Reclamos      | Ciudadano       |            | |
| |    |               |                 |            | |
| |    | [Editar] [Responsables] [Desactivar]         | |
| +---------------------------------------------------+ |
| | 3  | Certificados  | Recursos        | Activo     | |
| |    | Laborales     | Humanos         |            | |
| |    |               |                 |            | |
| |    | [Editar] [Responsables] [Desactivar]         | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Creación/Edición de Tema
```
+-------------------------------------------------------+
|                  CREAR NUEVO TEMA                     |
+-------------------------------------------------------+
|                                                       |
| Nombre*: [                                   ]        |
|                                                       |
| Descripción: [                               ]        |
|                                                       |
| Área*: [▼ Seleccione                         ]        |
|                                                       |
| Responsables por defecto:                             |
| +---------------------------------------------------+ |
| | [✓] Pedro Martínez (pedro.martinez)               | |
| | [ ] Ana Gómez (ana.gomez)                         | |
| | [✓] Laura Gómez (laura.gomez)                     | |
| +---------------------------------------------------+ |
|                                                       |
| Estado: [✓] Activo                                    |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

### Gestión de Responsables por Tema
```
+-------------------------------------------------------+
|        GESTIÓN DE RESPONSABLES: CERTIFICADOS          |
+-------------------------------------------------------+
|                                                       |
| Tema: Certificados Laborales                          |
| Área: Recursos Humanos                                |
|                                                       |
| Usuarios disponibles en el área:                      |
| +---------------------------------------------------+ |
| | [✓] Pedro Martínez (pedro.martinez)               | |
| | [ ] Ana Gómez (ana.gomez)                         | |
| | [✓] Laura Gómez (laura.gomez)                     | |
| | [ ] Carlos Pérez (carlos.perez)                   | |
| +---------------------------------------------------+ |
|                                                       |
| [✓] Seleccionar todos                                 |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- Los temas deben estar asociados a un área dentro de la estructura organizacional
- El nombre del tema debe ser único dentro de una misma área
- Al desactivar un tema, no debe aparecer como opción al crear nuevas PQRS
- Se debe permitir asignar uno o más responsables por defecto para cada tema
- Los responsables por defecto serán sugeridos al momento de asignar una PQRS
- Solo los usuarios que pertenecen al área correspondiente pueden ser asignados como responsables
- Los temas son fundamentales para la correcta categorización y asignación de PQRS
- Solo los usuarios con rol de Administrador o Coordinador pueden gestionar temas
- El sistema debe mantener un registro histórico de los temas para referencias en PQRS antiguas
