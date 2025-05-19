# HU-004: Respuesta a Seguimientos por Solicitante

## Descripción
**Como** solicitante de una PQRS  
**Quiero** poder responder a los seguimientos realizados por los funcionarios  
**Para** proporcionar información adicional o aclaraciones sobre mi solicitud

## Criterios de Aceptación

1. **Dado que** soy un solicitante consultando mi PQRS con radicado y token válidos  
   **Cuando** visualizo los seguimientos de mi PQRS  
   **Entonces** el sistema debe mostrar una opción para responder a los seguimientos

2. **Dado que** estoy respondiendo a un seguimiento de mi PQRS  
   **Cuando** ingreso mi comentario en el campo de respuesta  
   **Entonces** el sistema debe validar que el texto no esté vacío

3. **Dado que** estoy respondiendo a un seguimiento de mi PQRS  
   **Cuando** deseo adjuntar un archivo a mi respuesta  
   **Entonces** el sistema debe permitirme cargar un archivo y validar su tipo y tamaño

4. **Dado que** he completado mi respuesta a un seguimiento  
   **Cuando** envío la respuesta  
   **Entonces** el sistema debe:
   - Registrar mi respuesta en el historial de seguimientos
   - Actualizar la fecha de última actualización de la PQRS
   - Mostrar un mensaje de confirmación
   - Notificar al funcionario asignado sobre la nueva respuesta

5. **Dado que** soy un solicitante que ha respondido a un seguimiento  
   **Cuando** vuelvo a consultar mi PQRS  
   **Entonces** debo poder ver mi respuesta en el historial de seguimientos

6. **Dado que** soy un solicitante consultando mi PQRS  
   **Cuando** la PQRS tiene estado "RESUELTO" o "CERRADO"  
   **Entonces** el sistema debe mostrar una opción para reabrir la PQRS con una nueva respuesta

## Definición Técnica

### Endpoint
```
POST /api/pqrs/respuesta/{numeroRadicado}/{token}
```

### Parámetros de Ruta
```
numeroRadicado: String (Número de radicado de la PQRS)
token: String (Token de consulta asociado a la PQRS)
```

### Payload de Solicitud
```json
{
  "comentario": "Adjunto la información adicional solicitada para el trámite.",
  "archivoAdjunto": [archivo binario]
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
  "fechaUltimaActualizacion": "2025-05-21T09:15:00",
  "tema": {
    "idTema": 1,
    "nombre": "Información General",
    "area": {
      "idArea": 1,
      "nombre": "Atención al Ciudadano"
    }
  },
  "seguimientos": [
    {
      "idSeguimiento": 3,
      "comentario": "Adjunto la información adicional solicitada para el trámite.",
      "fechaCreacion": "2025-05-21T09:15:00",
      "tipoSeguimiento": "RESPUESTA_SOLICITANTE",
      "esRespuestaFinal": false,
      "archivoAdjunto": "informacion_adicional.pdf",
      "usuario": null
    },
    {
      "idSeguimiento": 2,
      "comentario": "Necesitamos información adicional para procesar su solicitud. ¿Podría proporcionarnos...?",
      "fechaCreacion": "2025-05-20T14:45:00",
      "tipoSeguimiento": "SEGUIMIENTO_INTERNO",
      "esRespuestaFinal": false,
      "archivoAdjunto": null,
      "usuario": {
        "idUsuario": 3,
        "username": "ana.gomez",
        "nombreCompleto": "Ana Gómez"
      }
    }
  ]
}
```

## Mockup de Interfaz

```
+-------------------------------------------------------+
|             DETALLE DE PQRS: PQRS-2025-00001          |
+-------------------------------------------------------+
| INFORMACIÓN GENERAL                                   |
|                                                       |
| Radicado: PQRS-2025-00001                             |
| Fecha de Creación: 19/05/2025 10:30 AM                |
| Estado: EN PROCESO                                    |
| Última Actualización: 21/05/2025 09:15 AM             |
|                                                       |
| DATOS DE LA SOLICITUD                                 |
|                                                       |
| Tema: Información General - Atención al Ciudadano     |
| Título: Solicitud de información sobre trámites       |
| Descripción: Requiero información detallada sobre...  |
| Prioridad: MEDIA                                      |
|                                                       |
| SEGUIMIENTOS                                          |
| +---------------------------------------------------+ |
| | 21/05/2025 09:15 AM - Juan Pérez (Solicitante)   | |
| | Adjunto la información adicional solicitada para  | |
| | el trámite.                                      | |
| | [Descargar: informacion_adicional.pdf]           | |
| +---------------------------------------------------+ |
| | 20/05/2025 02:45 PM - Ana Gómez                  | |
| | Necesitamos información adicional para procesar   | |
| | su solicitud. ¿Podría proporcionarnos...?        | |
| +---------------------------------------------------+ |
|                                                       |
| AGREGAR RESPUESTA                                     |
| +---------------------------------------------------+ |
| |                                                   | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| Adjuntar archivo: [       Seleccionar archivo...  ]   |
|                                                       |
|                   [     RESPONDER     ]               |
+-------------------------------------------------------+
```

## Notas Adicionales
- Las respuestas del solicitante deben distinguirse visualmente de las respuestas de los funcionarios
- El sistema debe validar que el archivo adjunto no exceda el tamaño máximo permitido (5MB)
- Los formatos de archivo permitidos son: PDF, DOC, DOCX, JPG, PNG
- El sistema debe enviar una notificación por correo electrónico al funcionario asignado cuando el solicitante responda
- Si la PQRS estaba en estado "RESUELTO" y el solicitante responde, el sistema debe cambiar automáticamente el estado a "EN_PROCESO"
