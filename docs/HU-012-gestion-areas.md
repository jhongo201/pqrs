# HU-012: Gestión de Áreas

## Descripción
**Como** administrador del sistema  
**Quiero** poder crear, actualizar y desactivar áreas dentro de la organización  
**Para** reflejar la estructura organizacional y facilitar la asignación de PQRS

## Criterios de Aceptación

1. **Dado que** soy un administrador del sistema  
   **Cuando** accedo al módulo de gestión de áreas  
   **Entonces** el sistema debe mostrar una lista de todas las áreas registradas con opciones para crear, editar y desactivar

2. **Dado que** estoy en el módulo de gestión de áreas  
   **Cuando** selecciono la opción de crear una nueva área  
   **Entonces** el sistema debe mostrar un formulario con los campos necesarios para registrar un área

3. **Dado que** estoy creando una nueva área  
   **Cuando** ingreso el nombre, descripción y selecciono la dirección a la que pertenece  
   **Entonces** el sistema debe validar que todos los campos obligatorios estén completos

4. **Dado que** estoy creando una nueva área  
   **Cuando** ingreso un nombre de área que ya existe en la misma dirección  
   **Entonces** el sistema debe mostrar un mensaje de error indicando que el área ya está registrada

5. **Dado que** he completado correctamente el formulario de creación de área  
   **Cuando** guardo la información  
   **Entonces** el sistema debe:
   - Crear el área con estado activo
   - Mostrar un mensaje de confirmación
   - Actualizar la lista de áreas

6. **Dado que** estoy en el módulo de gestión de áreas  
   **Cuando** selecciono la opción de editar un área existente  
   **Entonces** el sistema debe mostrar un formulario con la información actual del área y permitir su modificación

7. **Dado que** estoy editando un área  
   **Cuando** actualizo su información y guardo los cambios  
   **Entonces** el sistema debe actualizar los datos del área y mostrar un mensaje de confirmación

8. **Dado que** estoy en el módulo de gestión de áreas  
   **Cuando** selecciono la opción de desactivar un área  
   **Entonces** el sistema debe solicitar confirmación y, al confirmar, cambiar el estado del área a inactiva

9. **Dado que** un área tiene temas de PQRS asociados  
   **Cuando** intento desactivar esa área  
   **Entonces** el sistema debe mostrar una advertencia sobre los temas asociados y ofrecer opciones para reasignarlos o desactivarlos

## Definición Técnica

### Endpoints

#### Listar Áreas
```
GET /api/areas
```

#### Crear Área
```
POST /api/areas
```

#### Payload de Creación
```json
{
  "idDireccion": 1,
  "nombre": "Área de Sistemas",
  "descripcion": "Área de tecnología"
}
```

#### Obtener Área por ID
```
GET /api/areas/{id}
```

#### Actualizar Área
```
PUT /api/areas/{id}
```

#### Payload de Actualización
```json
{
  "idDireccion": 1,
  "nombre": "Área de TI",
  "descripcion": "Actualizada",
  "estado": true
}
```

#### Eliminar/Desactivar Área
```
DELETE /api/areas/{id}
```

### Respuesta Exitosa (Creación/Actualización)
```json
{
  "idArea": 4,
  "nombre": "Área de TI",
  "descripcion": "Actualizada",
  "estado": true,
  "direccion": {
    "idDireccion": 1,
    "nombre": "Dirección Administrativa",
    "descripcion": "Dirección encargada de la administración",
    "estado": true
  }
}
```

## Mockup de Interfaz

### Lista de Áreas
```
+-------------------------------------------------------+
|                  GESTIÓN DE ÁREAS                     |
+-------------------------------------------------------+
| [+ Nueva Área]                                        |
|                                                       |
| Filtrar por Dirección: [▼ Todas                ]      |
|                                                       |
| +---------------------------------------------------+ |
| | ID | Nombre        | Dirección        | Estado    | |
| +---------------------------------------------------+ |
| | 1  | Atención al   | Dirección de     | Activo    | |
| |    | Ciudadano     | Servicio         |           | |
| |    |               |                  |           | |
| |    | [Editar] [Desactivar]                        | |
| +---------------------------------------------------+ |
| | 2  | Recursos      | Dirección        | Activo    | |
| |    | Humanos       | Administrativa   |           | |
| |    |               |                  |           | |
| |    | [Editar] [Desactivar]                        | |
| +---------------------------------------------------+ |
| | 3  | Contabilidad  | Dirección        | Activo    | |
| |    |               | Financiera       |           | |
| |    |               |                  |           | |
| |    | [Editar] [Desactivar]                        | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Creación/Edición de Área
```
+-------------------------------------------------------+
|                  CREAR NUEVA ÁREA                     |
+-------------------------------------------------------+
|                                                       |
| Nombre*: [                                   ]        |
|                                                       |
| Descripción: [                               ]        |
|                                                       |
| Dirección*: [▼ Seleccione                    ]        |
|                                                       |
| Estado: [✓] Activo                                    |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

### Modal de Confirmación de Desactivación
```
+-------------------------------------------------------+
|              CONFIRMAR DESACTIVACIÓN                  |
+-------------------------------------------------------+
|                                                       |
| ¿Está seguro que desea desactivar el área             |
| "Atención al Ciudadano"?                              |
|                                                       |
| Esta área tiene 5 temas de PQRS asociados.            |
|                                                       |
| Opciones para los temas asociados:                    |
|                                                       |
| (•) Desactivar todos los temas asociados              |
| ( ) Reasignar temas a otra área                       |
|                                                       |
| Área destino: [▼ Seleccione                  ]        |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   CONFIRMAR   ]        |
+-------------------------------------------------------+
```

## Notas Adicionales
- Las áreas deben estar asociadas a una dirección dentro de la estructura organizacional
- El nombre del área debe ser único dentro de una misma dirección
- Al desactivar un área, se debe ofrecer la opción de reasignar o desactivar los temas asociados
- Las áreas inactivas no deben aparecer en las listas de selección para asignación de PQRS
- El sistema debe mantener un registro histórico de las áreas para referencias en PQRS antiguas
- Solo los usuarios con rol de Administrador pueden gestionar áreas
- La interfaz debe permitir filtrar áreas por dirección para facilitar la gestión
- Las áreas son fundamentales para la correcta asignación de PQRS a los funcionarios responsables
