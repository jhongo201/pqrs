# HU-001: Creación de PQRS por Usuario Público

## Descripción
**Como** usuario público (no registrado)  
**Quiero** poder crear una PQRS proporcionando mis datos personales y la información de mi solicitud  
**Para** poder comunicar mis peticiones, quejas, reclamos o sugerencias sin necesidad de tener una cuenta en el sistema

## Criterios de Aceptación

1. **Dado que** soy un usuario público que accede al sistema  
   **Cuando** selecciono la opción de crear una nueva PQRS  
   **Entonces** el sistema debe mostrar un formulario para ingresar mis datos personales y la información de mi solicitud

2. **Dado que** estoy llenando el formulario de PQRS  
   **Cuando** ingreso mis datos personales (nombre completo, tipo y número de documento, correo electrónico, teléfono)  
   **Entonces** el sistema debe validar que todos los campos obligatorios estén completos y con formato correcto

3. **Dado que** estoy llenando el formulario de PQRS  
   **Cuando** selecciono un tema para mi solicitud  
   **Entonces** el sistema debe mostrar los temas disponibles categorizados por área

4. **Dado que** estoy llenando el formulario de PQRS  
   **Cuando** ingreso el título y descripción de mi solicitud  
   **Entonces** el sistema debe validar que estos campos no estén vacíos

5. **Dado que** estoy llenando el formulario de PQRS  
   **Cuando** selecciono una prioridad para mi solicitud  
   **Entonces** el sistema debe permitirme elegir entre las opciones disponibles (Alta, Media, Baja)

6. **Dado que** he completado correctamente el formulario de PQRS  
   **Cuando** envío la solicitud  
   **Entonces** el sistema debe:
   - Generar un número de radicado único
   - Generar un token de consulta
   - Mostrar un mensaje de confirmación con el número de radicado
   - Enviar un correo electrónico de confirmación con el número de radicado y un enlace para consultar el estado de la PQRS

7. **Dado que** he enviado una PQRS como usuario público  
   **Cuando** recibo el correo de confirmación  
   **Entonces** el correo debe incluir:
   - El número de radicado
   - Un enlace para consultar el estado de la PQRS que incluya el token de consulta
   - Información sobre el proceso de atención de la PQRS

## Definición Técnica

### Endpoint
```
POST /api/pqrs/publico
```

### Payload de Solicitud
```json
{
  "idTema": 1,
  "nombreSolicitante": "Juan Pérez",
  "emailSolicitante": "juan.perez@example.com",
  "telefonoSolicitante": "3001234567",
  "tipoDocumentoSolicitante": "CC",
  "numeroDocumentoSolicitante": "1234567890",
  "titulo": "Solicitud de información sobre trámites",
  "descripcion": "Requiero información detallada sobre los trámites necesarios para...",
  "prioridad": "MEDIA"
}
```

### Respuesta Exitosa
```json
{
  "idPqrs": 1,
  "numeroRadicado": "PQRS-2025-00001",
  "tokenConsulta": "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6",
  "nombreSolicitante": "Juan Pérez",
  "emailSolicitante": "juan.perez@example.com",
  "telefonoSolicitante": "3001234567",
  "tipoDocumentoSolicitante": "CC",
  "numeroDocumentoSolicitante": "1234567890",
  "titulo": "Solicitud de información sobre trámites",
  "descripcion": "Requiero información detallada sobre los trámites necesarios para...",
  "prioridad": "MEDIA",
  "estadoPqrs": "PENDIENTE",
  "fechaCreacion": "2025-05-19T10:30:00",
  "tema": {
    "idTema": 1,
    "nombre": "Información General",
    "area": {
      "idArea": 1,
      "nombre": "Atención al Ciudadano"
    }
  }
}
```

## Mockup de Interfaz

```
+-------------------------------------------------------+
|                  CREAR NUEVA PQRS                     |
+-------------------------------------------------------+
| DATOS PERSONALES                                      |
|                                                       |
| Nombre Completo*: [                             ]     |
|                                                       |
| Tipo de Documento*:  [▼ Seleccione               ]    |
|                                                       |
| Número de Documento*: [                        ]      |
|                                                       |
| Correo Electrónico*: [                         ]      |
|                                                       |
| Teléfono*: [                                   ]      |
|                                                       |
| INFORMACIÓN DE LA SOLICITUD                           |
|                                                       |
| Tema*: [▼ Seleccione                           ]      |
|                                                       |
| Título*: [                                     ]      |
|                                                       |
| Descripción*:                                         |
| +---------------------------------------------------+ |
| |                                                   | |
| |                                                   | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| Prioridad*: ( ) Alta  (•) Media  ( ) Baja             |
|                                                       |
|                                                       |
|                      [   ENVIAR   ]                   |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe validar el formato del correo electrónico y número telefónico
- El sistema debe prevenir la creación de PQRS duplicadas en un corto período de tiempo
- Los campos marcados con asterisco (*) son obligatorios
- El token de consulta debe ser lo suficientemente seguro para evitar accesos no autorizados
