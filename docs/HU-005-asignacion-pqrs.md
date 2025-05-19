# HU-005: Asignación de PQRS

## Descripción
**Como** administrador o coordinador  
**Quiero** poder asignar una PQRS a un funcionario específico  
**Para** distribuir la carga de trabajo y asegurar que las solicitudes sean atendidas por personal capacitado

## Criterios de Aceptación

1. **Dado que** soy un administrador o coordinador con permisos de actualización  
   **Cuando** accedo a la lista de PQRS pendientes o sin asignar  
   **Entonces** el sistema debe mostrar todas las PQRS que no tienen un funcionario asignado

2. **Dado que** estoy visualizando una PQRS sin asignar  
   **Cuando** selecciono la opción de asignar  
   **Entonces** el sistema debe mostrar una lista de funcionarios disponibles para la asignación

3. **Dado que** estoy asignando una PQRS a un funcionario  
   **Cuando** selecciono un funcionario de la lista  
   **Entonces** el sistema debe mostrar información relevante del funcionario, como su carga actual de trabajo

4. **Dado que** estoy asignando una PQRS a un funcionario  
   **Cuando** confirmo la asignación e ingreso un motivo de asignación  
   **Entonces** el sistema debe:
   - Registrar la asignación
   - Crear un registro en el historial de asignaciones
   - Actualizar el estado de la PQRS si es necesario
   - Notificar al funcionario asignado

5. **Dado que** una PQRS ya tiene un funcionario asignado  
   **Cuando** decido reasignarla a otro funcionario  
   **Entonces** el sistema debe permitir la reasignación y registrar el historial del cambio con el motivo

6. **Dado que** estoy asignando o reasignando una PQRS  
   **Cuando** completo la asignación  
   **Entonces** el sistema debe mostrar un mensaje de confirmación y actualizar la información de la PQRS

## Definición Técnica

### Endpoint
```
POST /api/pqrs/{id}/asignar
```

### Parámetros de Ruta
```
id: Long (ID de la PQRS a asignar)
```

### Payload de Solicitud
```json
{
  "idUsuarioNuevo": 4,
  "motivoCambio": "Asignación por especialidad en el tema solicitado"
}
```

### Respuesta Exitosa
```json
{
  "idPqrs": 1,
  "numeroRadicado": "PQRS-2025-00001",
  "nombreSolicitante": "Juan Pérez",
  "emailSolicitante": "juan.perez@example.com",
  "telefonoSolicitante": "3001234567",
  "tipoDocumentoSolicitante": "CC",
  "numeroDocumentoSolicitante": "1234567890",
  "titulo": "Solicitud de información sobre trámites",
  "descripcion": "Requiero información detallada sobre los trámites necesarios para...",
  "prioridad": "MEDIA",
  "estadoPqrs": "EN_PROCESO",
  "fechaCreacion": "2025-05-19T10:30:00",
  "fechaUltimaActualizacion": "2025-05-19T14:20:00",
  "tema": {
    "idTema": 1,
    "nombre": "Información General",
    "area": {
      "idArea": 1,
      "nombre": "Atención al Ciudadano"
    }
  },
  "usuarioAsignado": {
    "idUsuario": 4,
    "username": "pedro.martinez",
    "nombreCompleto": "Pedro Martínez",
    "email": "pedro.martinez@example.com"
  }
}
```

## Mockup de Interfaz

### Lista de PQRS Sin Asignar
```
+-------------------------------------------------------+
|             PQRS PENDIENTES DE ASIGNACIÓN             |
+-------------------------------------------------------+
| Filtrar por: [▼ Todos los estados     ] [   Buscar  ] |
|                                                       |
| +---------------------------------------------------+ |
| | Radicado | Fecha       | Tema        | Prioridad  | |
| +---------------------------------------------------+ |
| | PQRS-2025| 19/05/2025  | Información | MEDIA      | |
| | -00001   | 10:30 AM    | General     |            | |
| |          |             |             |            | |
| | [Ver Detalle]  [Asignar]                          | |
| +---------------------------------------------------+ |
| | PQRS-2025| 19/05/2025  | Certificados| ALTA       | |
| | -00002   | 11:15 AM    | Laborales   |            | |
| |          |             |             |            | |
| | [Ver Detalle]  [Asignar]                          | |
| +---------------------------------------------------+ |
|                                                       |
|                  [<< Anterior] [Siguiente >>]         |
+-------------------------------------------------------+
```

### Formulario de Asignación
```
+-------------------------------------------------------+
|          ASIGNAR PQRS: PQRS-2025-00001                |
+-------------------------------------------------------+
| INFORMACIÓN DE LA PQRS                                |
|                                                       |
| Radicado: PQRS-2025-00001                             |
| Fecha de Creación: 19/05/2025 10:30 AM                |
| Tema: Información General - Atención al Ciudadano     |
| Título: Solicitud de información sobre trámites       |
| Prioridad: MEDIA                                      |
|                                                       |
| ASIGNACIÓN                                            |
|                                                       |
| Funcionario*: [▼ Seleccione                    ]      |
|                                                       |
| Información del funcionario:                          |
| - PQRS asignadas actualmente: 5                       |
| - PQRS pendientes: 3                                  |
| - Especialidad: Atención al Ciudadano                 |
|                                                       |
| Motivo de asignación*:                                |
| +---------------------------------------------------+ |
| |                                                   | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   ASIGNAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe mostrar la carga actual de trabajo de cada funcionario para facilitar una distribución equitativa
- Se debe mantener un historial completo de asignaciones para auditoría y seguimiento
- La notificación al funcionario asignado debe incluir los detalles relevantes de la PQRS
- Solo los usuarios con el permiso "PermitirActualizar" pueden realizar asignaciones
- El sistema debe validar que el funcionario seleccionado pertenezca al área relacionada con el tema de la PQRS o tenga permisos especiales
