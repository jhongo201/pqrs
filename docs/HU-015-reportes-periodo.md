# HU-015: Reportes por Período

## Descripción
**Como** coordinador o administrador  
**Quiero** poder generar reportes de PQRS por período, estado, prioridad y área  
**Para** analizar tendencias y evaluar el desempeño del sistema de atención

## Criterios de Aceptación

1. **Dado que** soy un coordinador o administrador  
   **Cuando** accedo al módulo de reportes  
   **Entonces** el sistema debe mostrar opciones para configurar y generar diferentes tipos de reportes

2. **Dado que** estoy en el módulo de reportes  
   **Cuando** selecciono un rango de fechas específico  
   **Entonces** el sistema debe permitirme definir el período para el cual quiero generar el reporte

3. **Dado que** estoy configurando un reporte  
   **Cuando** selecciono filtros adicionales como estado, prioridad o área  
   **Entonces** el sistema debe aplicar estos filtros a los datos del reporte

4. **Dado que** he configurado los parámetros del reporte  
   **Cuando** selecciono la opción de generar reporte  
   **Entonces** el sistema debe procesar los datos y mostrar el reporte según los criterios seleccionados

5. **Dado que** estoy visualizando un reporte generado  
   **Cuando** deseo exportar el reporte  
   **Entonces** el sistema debe permitirme descargar el reporte en diferentes formatos (PDF, Excel, CSV)

6. **Dado que** estoy visualizando un reporte de tiempo promedio de respuesta  
   **Cuando** analizo los datos por área  
   **Entonces** debo poder identificar qué áreas tienen los mejores y peores tiempos de respuesta

7. **Dado que** estoy visualizando un reporte de distribución de PQRS  
   **Cuando** analizo los datos por tema  
   **Entonces** debo poder identificar los temas más frecuentes en las solicitudes

8. **Dado que** estoy visualizando un reporte de eficiencia  
   **Cuando** analizo los datos por funcionario  
   **Entonces** debo poder identificar el rendimiento individual de cada funcionario

## Definición Técnica

### Endpoint
```
GET /api/pqrs/estadisticas/reportes
```

### Parámetros de Consulta
```
fechaInicio: LocalDateTime (Fecha de inicio del período)
fechaFin: LocalDateTime (Fecha de fin del período)
estado: String (Opcional, filtro por estado)
prioridad: String (Opcional, filtro por prioridad)
idArea: Long (Opcional, filtro por área)
```

### Respuesta Exitosa
```json
{
  "totalPqrs": 45,
  "porEstado": [
    {"estado": "PENDIENTE", "cantidad": 5},
    {"estado": "EN_PROCESO", "cantidad": 15},
    {"estado": "RESUELTO", "cantidad": 20},
    {"estado": "CERRADO", "cantidad": 5}
  ],
  "porPrioridad": [
    {"prioridad": "ALTA", "cantidad": 10},
    {"prioridad": "MEDIA", "cantidad": 25},
    {"prioridad": "BAJA", "cantidad": 10}
  ],
  "porArea": [
    {"area": "Atención al Ciudadano", "cantidad": 20},
    {"area": "Recursos Humanos", "cantidad": 15},
    {"area": "Sistemas", "cantidad": 10}
  ],
  "tiempoPromedio": 3.2,
  "tendenciaMensual": [
    {"mes": "Marzo 2025", "cantidad": 15},
    {"mes": "Abril 2025", "cantidad": 12},
    {"mes": "Mayo 2025", "cantidad": 18}
  ],
  "porFuncionario": [
    {
      "funcionario": "Pedro Martínez",
      "asignadas": 12,
      "resueltas": 10,
      "tiempoPromedio": 2.8
    },
    {
      "funcionario": "Ana Gómez",
      "asignadas": 15,
      "resueltas": 12,
      "tiempoPromedio": 3.5
    }
  ],
  "porTema": [
    {"tema": "Información General", "cantidad": 15},
    {"tema": "Certificados Laborales", "cantidad": 12},
    {"tema": "Soporte Técnico", "cantidad": 8}
  ]
}
```

## Mockup de Interfaz

### Configuración de Reporte
```
+-------------------------------------------------------+
|                 GENERACIÓN DE REPORTES                |
+-------------------------------------------------------+
|                                                       |
| PARÁMETROS DEL REPORTE                                |
|                                                       |
| Período*:                                             |
| Desde: [01/03/2025]  Hasta: [31/05/2025]              |
|                                                       |
| Filtros adicionales:                                  |
|                                                       |
| Estado: [▼ Todos                            ]         |
| Prioridad: [▼ Todas                         ]         |
| Área: [▼ Todas                              ]         |
|                                                       |
| Tipo de reporte:                                      |
| (•) General                                           |
| ( ) Por funcionario                                   |
| ( ) Por tema                                          |
| ( ) Tiempos de respuesta                              |
|                                                       |
|                                                       |
|             [   GENERAR REPORTE   ]                   |
+-------------------------------------------------------+
```

### Visualización de Reporte
```
+-------------------------------------------------------+
|                 REPORTE GENERAL DE PQRS               |
+-------------------------------------------------------+
| Período: 01/03/2025 - 31/05/2025                      |
|                                                       |
| RESUMEN                                               |
| Total de PQRS: 45                                     |
| Tiempo promedio de respuesta: 3.2 días                |
|                                                       |
| DISTRIBUCIÓN POR ESTADO                               |
| +---------------------------------------------------+ |
| |                                                   | |
| |  [Gráfico de barras mostrando distribución por    | |
| |   estado]                                         | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| DISTRIBUCIÓN POR PRIORIDAD                            |
| +---------------------------------------------------+ |
| |                                                   | |
| |  [Gráfico de barras mostrando distribución por    | |
| |   prioridad]                                      | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| DISTRIBUCIÓN POR ÁREA                                 |
| +---------------------------------------------------+ |
| |                                                   | |
| |  [Gráfico de barras mostrando distribución por    | |
| |   área]                                           | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| TENDENCIA MENSUAL                                     |
| +---------------------------------------------------+ |
| |                                                   | |
| |  [Gráfico de línea mostrando tendencia mensual]   | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| DETALLE POR FUNCIONARIO                               |
| +---------------------------------------------------+ |
| | Funcionario | Asignadas | Resueltas | T. Promedio | |
| +---------------------------------------------------+ |
| | Pedro M.    |    12     |    10     |    2.8      | |
| | Ana G.      |    15     |    12     |    3.5      | |
| +---------------------------------------------------+ |
|                                                       |
|                                                       |
| [PDF] [Excel] [CSV]        [   VOLVER   ]             |
+-------------------------------------------------------+
```

## Notas Adicionales
- Los reportes deben generarse de forma eficiente incluso con grandes volúmenes de datos
- Se debe permitir la exportación en múltiples formatos (PDF, Excel, CSV)
- Los gráficos deben incluir leyendas claras y ser visualmente intuitivos
- El sistema debe cachear los reportes frecuentes para mejorar el rendimiento
- Los reportes deben incluir metadatos como la fecha de generación y los filtros aplicados
- Solo los usuarios con rol de Administrador o Coordinador deben tener acceso a los reportes
- Se debe permitir guardar configuraciones de reportes para su uso frecuente
- Los reportes deben ser imprimibles con un formato adecuado
