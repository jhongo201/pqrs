# HU-008: Actualización de Prioridad de PQRS

## Descripción
**Como** funcionario con permisos de actualización  
**Quiero** poder cambiar la prioridad de una PQRS  
**Para** asegurar que las solicitudes más urgentes sean atendidas primero

## Criterios de Aceptación

1. **Dado que** soy un funcionario con permisos de actualización  
   **Cuando** accedo al detalle de una PQRS  
   **Entonces** el sistema debe mostrar la opción para cambiar la prioridad de la PQRS

2. **Dado que** estoy actualizando la prioridad de una PQRS  
   **Cuando** selecciono una nueva prioridad  
   **Entonces** el sistema debe mostrar las opciones disponibles: ALTA, MEDIA, BAJA

3. **Dado que** estoy cambiando la prioridad de una PQRS  
   **Cuando** confirmo el cambio  
   **Entonces** el sistema debe solicitar un motivo para el cambio de prioridad

4. **Dado que** he actualizado la prioridad de una PQRS  
   **Cuando** se completa la actualización  
   **Entonces** el sistema debe:
   - Registrar el cambio de prioridad con fecha, usuario y motivo
   - Actualizar la fecha de última actualización de la PQRS
   - Notificar al funcionario asignado sobre el cambio de prioridad
   - Mostrar un mensaje de confirmación

5. **Dado que** una PQRS ha cambiado a prioridad ALTA  
   **Cuando** se visualizan las listas de PQRS  
   **Entonces** el sistema debe destacar visualmente las PQRS de alta prioridad

## Definición Técnica

### Endpoint
```
PUT /api/pqrs/{id}/prioridad/{nuevaPrioridad}
```

### Parámetros de Ruta
```
id: Long (ID de la PQRS)
nuevaPrioridad: String (Nueva prioridad de la PQRS: ALTA, MEDIA, BAJA)
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
  "prioridad": "ALTA",
  "estadoPqrs": "EN_PROCESO",
  "fechaCreacion": "2025-05-19T10:30:00",
  "fechaUltimaActualizacion": "2025-05-24T09:15:00",
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

### Detalle de PQRS con Opción de Cambio de Prioridad
```
+-------------------------------------------------------+
|             DETALLE DE PQRS: PQRS-2025-00001          |
+-------------------------------------------------------+
| INFORMACIÓN GENERAL                                   |
|                                                       |
| Radicado: PQRS-2025-00001                             |
| Fecha de Creación: 19/05/2025 10:30 AM                |
| Estado: EN_PROCESO                                    |
| Última Actualización: 24/05/2025 09:15 AM             |
| Asignado a: Pedro Martínez                            |
|                                                       |
| DATOS DE LA SOLICITUD                                 |
|                                                       |
| Tema: Información General - Atención al Ciudadano     |
| Título: Solicitud de información sobre trámites       |
| Descripción: Requiero información detallada sobre...  |
| Prioridad: MEDIA  [   Cambiar Prioridad   ]           |
|                                                       |
| HISTORIAL DE SEGUIMIENTOS                             |
| +---------------------------------------------------+ |
```

### Modal de Cambio de Prioridad
```
+-------------------------------------------------------+
|             CAMBIAR PRIORIDAD DE PQRS                 |
+-------------------------------------------------------+
|                                                       |
| Prioridad Actual: MEDIA                               |
|                                                       |
| Nueva Prioridad*:                                     |
| (•) ALTA                                              |
| ( ) MEDIA                                             |
| ( ) BAJA                                              |
|                                                       |
| Motivo del cambio*:                                   |
| +---------------------------------------------------+ |
| | El solicitante requiere esta información con      | |
| | urgencia para un trámite con fecha límite.        | |
| +---------------------------------------------------+ |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

## Notas Adicionales
- Las prioridades disponibles son: ALTA, MEDIA, BAJA
- La prioridad por defecto al crear una PQRS es MEDIA
- Las PQRS con prioridad ALTA deben destacarse visualmente en las listas (por ejemplo, con color rojo)
- El sistema debe mantener un registro de los cambios de prioridad para auditoría
- Solo los usuarios con el permiso "PermitirActualizar" pueden cambiar la prioridad de una PQRS
- El cambio de prioridad debe generar una notificación al funcionario asignado
