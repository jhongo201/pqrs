# HU-016: Notificaciones por Correo Electrónico

## Descripción
**Como** usuario del sistema (solicitante o funcionario)  
**Quiero** recibir notificaciones por correo electrónico sobre eventos relevantes  
**Para** mantenerme informado sobre el estado de las PQRS sin necesidad de ingresar al sistema

## Criterios de Aceptación

1. **Dado que** soy un solicitante que ha creado una PQRS  
   **Cuando** mi solicitud es registrada exitosamente  
   **Entonces** debo recibir un correo electrónico de confirmación con el número de radicado y un enlace para consultar el estado

2. **Dado que** soy un solicitante con una PQRS en trámite  
   **Cuando** un funcionario agrega un seguimiento a mi PQRS  
   **Entonces** debo recibir un correo electrónico notificándome sobre la actualización

3. **Dado que** soy un solicitante con una PQRS en trámite  
   **Cuando** el estado de mi PQRS cambia (por ejemplo, a "RESUELTO")  
   **Entonces** debo recibir un correo electrónico informándome sobre el cambio de estado

4. **Dado que** soy un funcionario asignado a una PQRS  
   **Cuando** el solicitante responde o agrega información a la PQRS  
   **Entonces** debo recibir un correo electrónico notificándome sobre la nueva respuesta

5. **Dado que** soy un funcionario  
   **Cuando** me asignan una nueva PQRS  
   **Entonces** debo recibir un correo electrónico informándome sobre la asignación y los detalles de la PQRS

6. **Dado que** soy un coordinador o administrador  
   **Cuando** se crea una nueva PQRS en mi área  
   **Entonces** debo recibir un correo electrónico de notificación

7. **Dado que** soy un usuario del sistema  
   **Cuando** recibo un correo electrónico de notificación  
   **Entonces** el correo debe incluir enlaces directos para acceder a la PQRS correspondiente

8. **Dado que** soy un administrador del sistema  
   **Cuando** accedo a la configuración de notificaciones  
   **Entonces** debo poder personalizar las plantillas de correo y los eventos que generan notificaciones

## Definición Técnica

### Componentes Principales

1. **Servicio de Correo Electrónico**
   - Integración con Spring Mail
   - Configuración de servidor SMTP
   - Manejo de plantillas con Thymeleaf

2. **Plantillas de Correo**
   - Confirmación de creación de PQRS
   - Notificación de nuevo seguimiento
   - Notificación de cambio de estado
   - Notificación de asignación
   - Notificación de respuesta del solicitante

3. **Eventos que Generan Notificaciones**
   - Creación de PQRS
   - Asignación o reasignación de PQRS
   - Agregación de seguimiento
   - Cambio de estado
   - Respuesta del solicitante

### Implementación en el Código

```java
// Ejemplo de método para enviar confirmación de PQRS
public void enviarConfirmacionPQRS(String emailDestinatario, String numeroRadicado, String linkConsulta) {
    try {
        Context context = new Context();
        context.setVariable("numeroRadicado", numeroRadicado);
        context.setVariable("linkConsulta", linkConsulta);
        
        String contenido = templateEngine.process("emails/confirmacion-pqrs", context);
        
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        
        helper.setTo(emailDestinatario);
        helper.setSubject("Confirmación de Radicado PQRS: " + numeroRadicado);
        helper.setText(contenido, true);
        
        javaMailSender.send(message);
        log.info("Correo de confirmación enviado a: {}", emailDestinatario);
    } catch (Exception e) {
        log.error("Error al enviar correo de confirmación: {}", e.getMessage());
    }
}
```

## Mockup de Interfaz

### Configuración de Notificaciones
```
+-------------------------------------------------------+
|             CONFIGURACIÓN DE NOTIFICACIONES           |
+-------------------------------------------------------+
|                                                       |
| EVENTOS QUE GENERAN NOTIFICACIONES                    |
|                                                       |
| [✓] Creación de PQRS                                  |
| [✓] Asignación de PQRS                                |
| [✓] Nuevo seguimiento                                 |
| [✓] Cambio de estado                                  |
| [✓] Respuesta del solicitante                         |
|                                                       |
| DESTINATARIOS POR TIPO DE EVENTO                      |
|                                                       |
| Creación de PQRS:                                     |
| [✓] Solicitante                                       |
| [✓] Coordinador de área                               |
|                                                       |
| Asignación de PQRS:                                   |
| [✓] Funcionario asignado                              |
| [✓] Coordinador de área                               |
|                                                       |
| Nuevo seguimiento:                                    |
| [✓] Solicitante                                       |
| [ ] Funcionario asignado                              |
| [ ] Coordinador de área                               |
|                                                       |
|                                                       |
|          [   CANCELAR   ]    [   GUARDAR   ]          |
+-------------------------------------------------------+
```

### Ejemplo de Correo de Confirmación
```
+-------------------------------------------------------+
| De: sistema.pqrs@mintrabajo.gov.co                    |
| Para: juan.perez@example.com                          |
| Asunto: Confirmación de Radicado PQRS: PQRS-2025-00001|
+-------------------------------------------------------+
|                                                       |
|           MINISTERIO DE TRABAJO                       |
|           SISTEMA DE PQRS                             |
|                                                       |
| Estimado(a) Juan Pérez,                               |
|                                                       |
| Su solicitud ha sido registrada exitosamente en       |
| nuestro sistema con el siguiente número de radicado:  |
|                                                       |
|              PQRS-2025-00001                          |
|                                                       |
| Detalles de su solicitud:                             |
| - Fecha de creación: 19/05/2025 10:30 AM              |
| - Tema: Información General                           |
| - Título: Solicitud de información sobre trámites     |
|                                                       |
| Para consultar el estado de su solicitud, haga clic   |
| en el siguiente enlace:                               |
|                                                       |
| [Consultar estado de mi PQRS]                         |
|                                                       |
| Este enlace es personal y le permitirá acceder a la   |
| información de su solicitud sin necesidad de          |
| registrarse en el sistema.                            |
|                                                       |
| Gracias por utilizar nuestro sistema de PQRS.         |
|                                                       |
| Atentamente,                                          |
|                                                       |
| Ministerio de Trabajo                                 |
| Sistema de PQRS                                       |
|                                                       |
| Este es un correo automático, por favor no responda   |
| a este mensaje.                                       |
+-------------------------------------------------------+
```

## Notas Adicionales
- Las notificaciones por correo electrónico deben seguir la identidad visual de la entidad
- Los correos deben ser enviados en formato HTML con una alternativa en texto plano
- Se debe implementar un mecanismo de reintentos para el envío de correos en caso de fallos
- Los enlaces incluidos en los correos deben ser seguros y tener un tiempo de expiración adecuado
- Se debe mantener un registro de los correos enviados para auditoría
- Los usuarios deben poder configurar qué notificaciones desean recibir en su perfil
- El sistema debe manejar adecuadamente los rebotes y errores de envío
- Las plantillas de correo deben ser configurables por el administrador del sistema
