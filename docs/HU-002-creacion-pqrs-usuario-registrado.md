# HU-002: Creación de PQRS por Usuario Registrado

## Descripción
**Como** usuario registrado en el sistema  
**Quiero** poder crear una PQRS sin tener que ingresar nuevamente mis datos personales  
**Para** agilizar el proceso de comunicación con la entidad

## Criterios de Aceptación

1. **Dado que** soy un usuario registrado que ha iniciado sesión en el sistema  
   **Cuando** selecciono la opción de crear una nueva PQRS  
   **Entonces** el sistema debe mostrar un formulario pre-llenado con mis datos personales

2. **Dado que** estoy llenando el formulario de PQRS como usuario registrado  
   **Cuando** visualizo mis datos personales (nombre, tipo y número de documento, correo, teléfono)  
   **Entonces** estos campos deben estar pre-llenados y no editables

3. **Dado que** estoy llenando el formulario de PQRS como usuario registrado  
   **Cuando** selecciono un tema para mi solicitud  
   **Entonces** el sistema debe mostrar los temas disponibles categorizados por área

4. **Dado que** estoy llenando el formulario de PQRS como usuario registrado  
   **Cuando** ingreso el título y descripción de mi solicitud  
   **Entonces** el sistema debe validar que estos campos no estén vacíos

5. **Dado que** estoy llenando el formulario de PQRS como usuario registrado  
   **Cuando** selecciono una prioridad para mi solicitud  
   **Entonces** el sistema debe permitirme elegir entre las opciones disponibles (Alta, Media, Baja)

6. **Dado que** estoy llenando el formulario de PQRS como usuario registrado  
   **Cuando** deseo adjuntar un archivo a mi solicitud  
   **Entonces** el sistema debe permitirme cargar un archivo y validar su tipo y tamaño

7. **Dado que** he completado correctamente el formulario de PQRS como usuario registrado  
   **Cuando** envío la solicitud  
   **Entonces** el sistema debe:
   - Generar un número de radicado único
   - Generar un token de consulta
   - Mostrar un mensaje de confirmación con el número de radicado
   - Enviar un correo electrónico de confirmación
   - Registrar la PQRS asociada a mi cuenta de usuario

8. **Dado que** he enviado una PQRS como usuario registrado  
   **Cuando** accedo a la sección "Mis PQRS" en el sistema  
   **Entonces** debo poder ver la PQRS creada en la lista con su estado actual

9. **Dado que** intento crear una PQRS para un área donde ya tengo una PQRS activa  
   **Cuando** selecciono el tema asociado a esa área  
   **Entonces** el sistema debe mostrar un mensaje indicando que ya tengo una PQRS activa en esa área y no permitir la creación de una nueva

## Definición Técnica

### Endpoint
```
POST /api/pqrs
```

### Parámetros de Solicitud
```
idTema: Long (ID del tema seleccionado)
titulo: String (Título de la PQRS)
descripcion: String (Descripción detallada de la PQRS)
prioridad: String (ALTA, MEDIA, BAJA)
archivo: MultipartFile (Opcional, archivo adjunto)
```

### Respuesta Exitosa
```json
{
  "idPqrs": 2,
  "numeroRadicado": "PQRS-2025-00002",
  "tokenConsulta": "b2c3d4e5-f6g7-h8i9-j0k1-l2m3n4o5p6q7",
  "nombreSolicitante": "Carlos Rodríguez",
  "emailSolicitante": "carlos.rodriguez@example.com",
  "telefonoSolicitante": "3109876543",
  "tipoDocumentoSolicitante": "CC",
  "numeroDocumentoSolicitante": "0987654321",
  "titulo": "Solicitud de certificado laboral",
  "descripcion": "Necesito un certificado laboral para trámite bancario...",
  "prioridad": "ALTA",
  "estadoPqrs": "PENDIENTE",
  "fechaCreacion": "2025-05-19T11:15:00",
  "tema": {
    "idTema": 3,
    "nombre": "Certificaciones",
    "area": {
      "idArea": 2,
      "nombre": "Recursos Humanos"
    }
  },
  "seguimientos": [
    {
      "idSeguimiento": 1,
      "comentario": "Archivo adjunto en la creación del PQRS",
      "fechaCreacion": "2025-05-19T11:15:00",
      "tipoSeguimiento": "ADJUNTO_INICIAL",
      "archivoAdjunto": "solicitud_certificado_12345.pdf",
      "usuario": {
        "idUsuario": 5,
        "username": "carlos.rodriguez",
        "nombreCompleto": "Carlos Rodríguez"
      }
    }
  ]
}
```

## Mockup de Interfaz

```
+-------------------------------------------------------+
|                  CREAR NUEVA PQRS                     |
+-------------------------------------------------------+
| DATOS PERSONALES                                      |
|                                                       |
| Nombre: Carlos Rodríguez                              |
| Tipo de Documento: CC                                 |
| Número de Documento: 0987654321                       |
| Correo Electrónico: carlos.rodriguez@example.com      |
| Teléfono: 3109876543                                  |
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
| Adjuntar archivo: [       Seleccionar archivo...  ]   |
|                                                       |
|                      [   ENVIAR   ]                   |
+-------------------------------------------------------+
```

## Notas Adicionales
- Los datos personales del usuario se obtienen automáticamente de su perfil registrado
- Se debe validar que el usuario no tenga una PQRS activa en la misma área
- El archivo adjunto debe tener un tamaño máximo de 5MB
- Los formatos de archivo permitidos son: PDF, DOC, DOCX, JPG, PNG
- El sistema debe registrar qué usuario creó la PQRS para futuras referencias
