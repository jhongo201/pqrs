# HU-007: Actualización de Estado de PQRS

## Descripción
**Como** funcionario asignado a una PQRS  
**Quiero** poder actualizar el estado de una PQRS (pendiente, en proceso, resuelto, cerrado)  
**Para** reflejar el progreso en la atención de la solicitud

## Criterios de Aceptación

1. **Dado que** soy un funcionario con permisos de actualización  
   **Cuando** accedo al detalle de una PQRS  
   **Entonces** el sistema debe mostrar la opción para cambiar el estado de la PQRS

2. **Dado que** estoy actualizando el estado de una PQRS  
   **Cuando** selecciono un nuevo estado  
   **Entonces** el sistema debe mostrar los estados disponibles según el flujo permitido (por ejemplo, no se puede pasar de "PENDIENTE" a "CERRADO" directamente)

3. **Dado que** estoy cambiando el estado de una PQRS a "RESUELTO"  
   **Cuando** confirmo el cambio  
   **Entonces** el sistema debe solicitar que se agregue un seguimiento con la resolución o verificar que exista una respuesta final

4. **Dado que** estoy cambiando el estado de una PQRS a "CERRADO"  
   **Cuando** confirmo el cambio  
   **Entonces** el sistema debe verificar que la PQRS haya estado en estado "RESUELTO" por un período mínimo

5. **Dado que** he actualizado el estado de una PQRS  
   **Cuando** se completa la actualización  
   **Entonces** el sistema debe:
   - Registrar el cambio de estado con fecha y usuario
   - Actualizar la fecha de última actualización de la PQRS
   - Enviar una notificación al solicitante sobre el cambio de estado
   - Mostrar un mensaje de confirmación

6. **Dado que** una PQRS ha sido resuelta o cerrada  
   **Cuando** el solicitante responde con nueva información  
   **Entonces** el sistema debe permitir reabrir la PQRS y cambiar su estado a "EN_PROCESO"

## Definición Técnica

### Endpoint
```
PUT /api/pqrs/{id}/estado/{nuevoEstado}
```

### Parámetros de Ruta
```
id: Long (ID de la PQRS)
nuevoEstado: String (Nuevo estado de la PQRS: PENDIENTE, EN_PROCESO, RESUELTO, CERRADO)
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
  "estadoPqrs": "RESUELTO",
  "fechaCreacion": "2025-05-19T10:30:00",
  "fechaUltimaActualizacion": "2025-05-23T15:30:00",
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
  },
  "seguimientos": [
    {
      "idSeguimiento": 5,
      "comentario": "Se ha completado la solicitud de información. Adjunto documento con todos los trámites solicitados.",
      "fechaCreacion": "2025-05-23T15:30:00",
      "tipoSeguimiento": "SEGUIMIENTO_INTERNO",
      "esRespuestaFinal": true,
      "archivoAdjunto": "tramites_completos.pdf",
      "usuario": {
        "idUsuario": 4,
        "username": "pedro.martinez",
        "nombreCompleto": "Pedro Martínez"
      }
    }
  ]
}
```

## Mockup de Interfaz

### Detalle de PQRS con Opción de Cambio de Estado
```
+-------------------------------------------------------+
|             DETALLE DE PQRS: PQRS-2025-00001          |
+-------------------------------------------------------+
| INFORMACIÓN GENERAL                                   |
|                                                       |
| Radicado: PQRS-2025-00001                             |
| Fecha de Creación: 19/05/2025 10:30 AM                |
| Estado: EN_PROCESO  [   Cambiar Estado   ]            |
| Última Actualización: 22/05/2025 11:45 AM             |
| Asignado a: Pedro Martínez                            |
|                                                       |
| DATOS DE LA SOLICITUD                                 |
|                                                       |
| Tema: Información General - Atención al Ciudadano     |
| Título: Solicitud de información sobre trámites       |
| Descripción: Requiero información detallada sobre...  |
| Prioridad: MEDIA                                      |
|                                                       |
| HISTORIAL DE SEGUIMIENTOS                             |
| +---------------------------------------------------+ |
| | 22/05/2025 11:45 AM - Pedro Martínez             | |
| | Adjunto el documento con la información solicitada| |
| | sobre los trámites.                              | |
| | [Descargar: informacion_tramites.pdf]            | |
| +---------------------------------------------------+ |
```

### Modal de Cambio de Estado
```
+-------------------------------------------------------+
|             CAMBIAR ESTADO DE PQRS                    |
+-------------------------------------------------------+
|                                                       |
| Estado Actual: EN_PROCESO                             |
|                                                       |
| Nuevo Estado*:                                        |
| ( ) PENDIENTE                                         |
| (•) RESUELTO                                          |
| ( ) CERRADO                                           |
|                                                       |
| Nota: Al cambiar a RESUELTO, debe agregar un          |
| seguimiento con la resolución final.                  |
|                                                       |
| Comentario de resolución:                             |
| +---------------------------------------------------+ |
| | Se ha completado la solicitud de información.     | |
| | Adjunto documento con todos los trámites          | |
| | solicitados.                                      | |
| +---------------------------------------------------+ |
|                                                       |
| Adjuntar archivo: [       Seleccionar archivo...  ]   |
|                                                       |
| [✓] Marcar como respuesta final                       |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- Los estados posibles de una PQRS son: PENDIENTE, EN_PROCESO, RESUELTO, CERRADO
- El flujo normal de estados es: PENDIENTE → EN_PROCESO → RESUELTO → CERRADO
- Para cambiar a estado RESUELTO, debe existir al menos un seguimiento marcado como respuesta final
- Para cambiar a estado CERRADO, la PQRS debe haber estado en estado RESUELTO por al menos 5 días hábiles
- El sistema debe enviar notificaciones por correo electrónico al solicitante cuando cambia el estado de su PQRS
- Solo los usuarios con el permiso "PermitirActualizar" pueden cambiar el estado de una PQRS
- El sistema debe registrar en un log todos los cambios de estado para auditoría
