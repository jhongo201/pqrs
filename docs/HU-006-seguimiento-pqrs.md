# HU-006: Seguimiento de PQRS

## Descripción
**Como** funcionario asignado a una PQRS  
**Quiero** poder agregar comentarios y archivos adjuntos a una PQRS  
**Para** documentar las acciones tomadas y mantener informado al solicitante

## Criterios de Aceptación

1. **Dado que** soy un funcionario asignado a una PQRS  
   **Cuando** accedo al detalle de la PQRS  
   **Entonces** el sistema debe mostrar la opción para agregar un nuevo seguimiento

2. **Dado que** estoy agregando un seguimiento a una PQRS  
   **Cuando** ingreso un comentario en el campo correspondiente  
   **Entonces** el sistema debe validar que el texto no esté vacío

3. **Dado que** estoy agregando un seguimiento a una PQRS  
   **Cuando** deseo adjuntar un archivo al seguimiento  
   **Entonces** el sistema debe permitirme cargar un archivo y validar su tipo y tamaño

4. **Dado que** estoy agregando un seguimiento a una PQRS  
   **Cuando** indico que es una respuesta final  
   **Entonces** el sistema debe solicitar confirmación y advertir que esto cambiará el estado de la PQRS a "RESUELTO"

5. **Dado que** he completado un seguimiento  
   **Cuando** guardo el seguimiento  
   **Entonces** el sistema debe:
   - Registrar el seguimiento con fecha, hora y usuario
   - Actualizar la fecha de última actualización de la PQRS
   - Cambiar el estado de la PQRS si es una respuesta final
   - Enviar una notificación al solicitante

6. **Dado que** he agregado un seguimiento a una PQRS  
   **Cuando** vuelvo a consultar la PQRS  
   **Entonces** debo poder ver mi seguimiento en el historial en orden cronológico

7. **Dado que** estoy visualizando el historial de seguimientos  
   **Cuando** hay archivos adjuntos  
   **Entonces** el sistema debe permitirme descargar los archivos

## Definición Técnica

### Endpoint
```
POST /api/pqrs/{id}/seguimiento
```

### Parámetros de Ruta
```
id: Long (ID de la PQRS)
```

### Parámetros de Solicitud
```
comentario: String (Texto del seguimiento)
esRespuestaFinal: boolean (Indica si es una respuesta final)
archivo: MultipartFile (Opcional, archivo adjunto)
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
  "fechaUltimaActualizacion": "2025-05-22T11:45:00",
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
      "idSeguimiento": 4,
      "comentario": "Adjunto el documento con la información solicitada sobre los trámites.",
      "fechaCreacion": "2025-05-22T11:45:00",
      "tipoSeguimiento": "SEGUIMIENTO_INTERNO",
      "esRespuestaFinal": false,
      "archivoAdjunto": "informacion_tramites.pdf",
      "usuario": {
        "idUsuario": 4,
        "username": "pedro.martinez",
        "nombreCompleto": "Pedro Martínez"
      }
    },
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
| AGREGAR SEGUIMIENTO                                   |
| +---------------------------------------------------+ |
| |                                                   | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| Adjuntar archivo: [       Seleccionar archivo...  ]   |
|                                                       |
| [ ] Es respuesta final                                |
|                                                       |
|                   [     GUARDAR     ]                 |
+-------------------------------------------------------+
```

## Notas Adicionales
- Los seguimientos deben mostrarse en orden cronológico inverso (más recientes primero)
- El sistema debe diferenciar visualmente entre seguimientos internos y respuestas del solicitante
- Si se marca como respuesta final, el sistema debe cambiar automáticamente el estado de la PQRS a "RESUELTO"
- El sistema debe enviar una notificación por correo electrónico al solicitante cuando se agrega un nuevo seguimiento
- El archivo adjunto debe tener un tamaño máximo de 5MB
- Los formatos de archivo permitidos son: PDF, DOC, DOCX, JPG, PNG, XLS, XLSX
- Solo los usuarios con el permiso "PermitirEscritura" pueden agregar seguimientos
