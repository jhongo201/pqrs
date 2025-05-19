# HU-011: Configuración de Permisos por Rol

## Descripción
**Como** administrador del sistema  
**Quiero** poder configurar permisos específicos para cada rol  
**Para** implementar un control de acceso granular a las funcionalidades del sistema

## Criterios de Aceptación

1. **Dado que** soy un administrador del sistema  
   **Cuando** accedo a la configuración de permisos de un rol  
   **Entonces** el sistema debe mostrar todas las rutas disponibles agrupadas por módulo

2. **Dado que** estoy configurando permisos para un rol  
   **Cuando** selecciono un módulo específico  
   **Entonces** el sistema debe filtrar y mostrar solo las rutas pertenecientes a ese módulo

3. **Dado que** estoy configurando permisos para un rol  
   **Cuando** asigno permisos de lectura, escritura, actualización o eliminación a una ruta  
   **Entonces** el sistema debe guardar esa configuración específica para el rol seleccionado

4. **Dado que** estoy configurando permisos para un rol  
   **Cuando** selecciono la opción "Seleccionar todos"  
   **Entonces** el sistema debe marcar todas las rutas visibles con los permisos seleccionados

5. **Dado que** he configurado los permisos para un rol  
   **Cuando** guardo los cambios  
   **Entonces** el sistema debe:
   - Actualizar los permisos del rol
   - Aplicar los cambios a todos los usuarios con ese rol
   - Mostrar un mensaje de confirmación

6. **Dado que** un usuario con un rol específico intenta acceder a una funcionalidad  
   **Cuando** el sistema verifica los permisos  
   **Entonces** debe permitir o denegar el acceso según la configuración de permisos del rol

7. **Dado que** estoy configurando permisos para un rol  
   **Cuando** marco una ruta como pública  
   **Entonces** el sistema debe permitir el acceso a esa ruta sin autenticación

## Definición Técnica

### Endpoints

#### Listar Permisos por Rol
```
GET /api/permisos-rol/rol/{idRol}
```

#### Listar Rutas por Módulo
```
GET /api/rutas/modulo/{idModulo}
```

#### Asignar Permiso a Rol
```
POST /api/permisos-rol
```

#### Payload de Asignación
```json
{
  "idRol": 2,
  "idRuta": 7,
  "puedeLeer": true,
  "puedeEscribir": true,
  "puedeActualizar": false,
  "puedeEliminar": false
}
```

#### Actualizar Permiso
```
PUT /api/permisos-rol/{idPermiso}
```

#### Eliminar Permiso
```
DELETE /api/permisos-rol/{idPermiso}
```

### Respuesta Exitosa (Listar Permisos por Rol)
```json
[
  {
    "idPermiso": 15,
    "rol": {
      "idRol": 2,
      "nombre": "Funcionario"
    },
    "ruta": {
      "idRuta": 7,
      "ruta": "/api/pqrs",
      "descripcion": "Gestión de PQRS",
      "modulo": {
        "idModulo": 2,
        "nombre": "PQRS"
      },
      "esPublica": false
    },
    "puedeLeer": true,
    "puedeEscribir": true,
    "puedeActualizar": false,
    "puedeEliminar": false,
    "estado": true,
    "fechaCreacion": "2025-05-27T14:20:00"
  },
  {
    "idPermiso": 16,
    "rol": {
      "idRol": 2,
      "nombre": "Funcionario"
    },
    "ruta": {
      "idRuta": 8,
      "ruta": "/api/pqrs/{id}",
      "descripcion": "Detalle de PQRS",
      "modulo": {
        "idModulo": 2,
        "nombre": "PQRS"
      },
      "esPublica": false
    },
    "puedeLeer": true,
    "puedeEscribir": false,
    "puedeActualizar": true,
    "puedeEliminar": false,
    "estado": true,
    "fechaCreacion": "2025-05-27T14:20:00"
  }
]
```

## Mockup de Interfaz

### Configuración de Permisos por Rol
```
+-------------------------------------------------------+
|            CONFIGURAR PERMISOS: FUNCIONARIO           |
+-------------------------------------------------------+
|                                                       |
| Módulo: [▼ PQRS                             ]         |
|                                                       |
| +---------------------------------------------------+ |
| | Ruta                | Leer | Escr | Act  | Elim  | |
| +---------------------------------------------------+ |
| | /api/pqrs           | [✓]  | [✓]  | [ ]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/pqrs/{id}      | [✓]  | [ ]  | [✓]  | [ ]   | |
| +---------------------------------------------------+ |
| | /api/pqrs/{id}/seguimiento | [✓]  | [✓]  | [ ]  | [ ] | |
| +---------------------------------------------------+ |
| | /api/pqrs/{id}/estado | [✓]  | [ ]  | [✓]  | [ ] | |
| +---------------------------------------------------+ |
| | /api/pqrs/mis-pqrs  | [✓]  | [ ]  | [ ]  | [ ]   | |
| +---------------------------------------------------+ |
|                                                       |
| Acciones para rutas seleccionadas:                    |
| [ ] Leer  [ ] Escribir  [ ] Actualizar  [ ] Eliminar  |
| [   Aplicar a seleccionados   ]                       |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

### Gestión de Rutas y Módulos
```
+-------------------------------------------------------+
|                  GESTIÓN DE RUTAS                     |
+-------------------------------------------------------+
| [+ Nueva Ruta]                                        |
|                                                       |
| Módulo: [▼ Todos                             ]        |
|                                                       |
| +---------------------------------------------------+ |
| | ID | Ruta          | Descripción      | Módulo    | |
| +---------------------------------------------------+ |
| | 7  | /api/pqrs     | Gestión de PQRS  | PQRS      | |
| |    |               |                  |           | |
| |    | [Editar] [Eliminar]                          | |
| +---------------------------------------------------+ |
| | 8  | /api/pqrs/{id}| Detalle de PQRS  | PQRS      | |
| |    |               |                  |           | |
| |    | [Editar] [Eliminar]                          | |
| +---------------------------------------------------+ |
| | 9  | /api/usuarios | Gestión usuarios | Usuarios  | |
| |    |               |                  |           | |
| |    | [Editar] [Eliminar]                          | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Creación/Edición de Ruta
```
+-------------------------------------------------------+
|                  CREAR NUEVA RUTA                     |
+-------------------------------------------------------+
|                                                       |
| Ruta*: [                                      ]       |
|                                                       |
| Descripción*: [                               ]       |
|                                                       |
| Módulo*: [▼ Seleccione                       ]        |
|                                                       |
| [ ] Es ruta pública (no requiere autenticación)       |
|                                                       |
| Estado: [✓] Activo                                    |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe implementar anotaciones personalizadas (@PermitirLectura, @PermitirEscritura, etc.) para facilitar la verificación de permisos en el código
- Las rutas públicas (como login, registro público de PQRS) deben marcarse explícitamente como tales
- Los permisos se evalúan en tiempo de ejecución para cada solicitud
- El sistema debe cachear los permisos para mejorar el rendimiento
- Cuando se crea una nueva ruta, debe asignarse automáticamente al rol de Administrador con todos los permisos
- El sistema debe registrar intentos de acceso no autorizados para auditoría
- La interfaz debe permitir la asignación masiva de permisos para facilitar la configuración
- Los cambios en los permisos deben aplicarse inmediatamente sin necesidad de reiniciar el sistema
