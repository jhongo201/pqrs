# HU-003: Consulta de PQRS por Número de Radicado

## Descripción
**Como** solicitante (registrado o no)  
**Quiero** poder consultar el estado de mi PQRS usando el número de radicado y token asignado  
**Para** hacer seguimiento a mi solicitud sin necesidad de contactar directamente a la entidad

## Criterios de Aceptación

1. **Dado que** soy un solicitante que recibió un número de radicado y token de consulta  
   **Cuando** accedo a la página de consulta de PQRS  
   **Entonces** el sistema debe mostrar un formulario para ingresar el número de radicado y token

2. **Dado que** estoy en la página de consulta de PQRS  
   **Cuando** ingreso un número de radicado y token válidos  
   **Entonces** el sistema debe mostrar la información detallada de mi PQRS, incluyendo:
   - Datos básicos de la solicitud (fecha, tema, título, descripción)
   - Estado actual de la solicitud
   - Historial de seguimientos y respuestas
   - Archivos adjuntos asociados

3. **Dado que** estoy en la página de consulta de PQRS  
   **Cuando** ingreso un número de radicado inválido o que no existe  
   **Entonces** el sistema debe mostrar un mensaje de error indicando que el radicado no fue encontrado

4. **Dado que** estoy en la página de consulta de PQRS  
   **Cuando** ingreso un número de radicado válido pero un token incorrecto  
   **Entonces** el sistema debe mostrar un mensaje de error por motivos de seguridad sin confirmar la existencia del radicado

5. **Dado que** estoy consultando mi PQRS con radicado y token válidos  
   **Cuando** visualizo los seguimientos de mi PQRS  
   **Entonces** debo poder ver todos los comentarios, fechas y archivos adjuntos en orden cronológico

6. **Dado que** estoy consultando mi PQRS con radicado y token válidos  
   **Cuando** deseo responder a un seguimiento  
   **Entonces** el sistema debe proporcionarme una opción para agregar una respuesta

## Definición Técnica

### Endpoint
```
GET /api/pqrs/consulta/{numeroRadicado}/{token}
```

### Parámetros de Ruta
```
numeroRadicado: String (Número de radicado de la PQRS)
token: String (Token de consulta asociado a la PQRS)
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
  "fechaUltimaActualizacion": "2025-05-20T14:45:00",
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
      "idSeguimiento": 2,
      "comentario": "Hemos recibido su solicitud y estamos procesándola. Le informaremos cuando tengamos una respuesta.",
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

### Pantalla de Consulta
```
+-------------------------------------------------------+
|             CONSULTAR ESTADO DE PQRS                  |
+-------------------------------------------------------+
|                                                       |
| Número de Radicado*: [                        ]       |
|                                                       |
| Token de Consulta*:  [                        ]       |
|                                                       |
|                   [    CONSULTAR    ]                 |
|                                                       |
+-------------------------------------------------------+
```

### Pantalla de Resultados
```
+-------------------------------------------------------+
|             DETALLE DE PQRS: PQRS-2025-00001          |
+-------------------------------------------------------+
| INFORMACIÓN GENERAL                                   |
|                                                       |
| Radicado: PQRS-2025-00001                             |
| Fecha de Creación: 19/05/2025 10:30 AM                |
| Estado: EN PROCESO                                    |
| Última Actualización: 20/05/2025 02:45 PM             |
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
| | 20/05/2025 02:45 PM - Ana Gómez                  | |
| | Hemos recibido su solicitud y estamos            | |
| | procesándola. Le informaremos cuando tengamos    | |
| | una respuesta.                                   | |
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
- El token de consulta es un mecanismo de seguridad para garantizar que solo el solicitante pueda acceder a la información de su PQRS
- El sistema no debe revelar información sensible en caso de errores de autenticación
- La interfaz debe ser clara y mostrar el estado actual de la PQRS de manera destacada
- Se debe permitir la descarga de archivos adjuntos tanto de la solicitud original como de los seguimientos
