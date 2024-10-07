# Actividad 7 - Completely Fair Scheduler



El **Completely Fair Scheduler (CFS)** es el planificador de procesos por defecto en el núcleo de Linux desde la versión 2.6.23. Fue diseñado para ser más justo y eficiente en la distribución del tiempo de CPU entre procesos en sistemas modernos.

## Características principales

1. **Equidad en la distribución de CPU:**
   El CFS tiene como objetivo distribuir el tiempo de CPU de manera equitativa entre todos los procesos en ejecución. Esto significa que intenta garantizar que cada proceso reciba la misma cantidad de tiempo de CPU, siempre que tengan la misma prioridad.

2. **Basado en tiempo de ejecución virtual:**
   CFS utiliza el concepto de **tiempo de ejecución virtual** para determinar cuánto tiempo de CPU ha recibido cada proceso. El tiempo de ejecución virtual se incrementa a medida que el proceso utiliza la CPU, y el planificador selecciona el proceso con el menor tiempo de ejecución virtual para ejecutar a continuación.

3. **Árbol Red-Black:**
   CFS organiza los procesos en un **árbol Red-Black** (un tipo de estructura de datos de árbol equilibrado). Esto permite encontrar el siguiente proceso a ejecutar en tiempo O(log n), lo que es eficiente incluso con un gran número de procesos.

4. **Prioridades ponderadas:**
   Aunque CFS trata de ser justo, también respeta las **prioridades de los procesos**. Los procesos con mayor prioridad tendrán un tiempo de ejecución virtual más bajo en comparación con los de menor prioridad, lo que les permitirá ejecutarse más a menudo.

5. **Bajo tiempo de respuesta:**
   CFS está diseñado para ofrecer **bajos tiempos de respuesta** para aplicaciones interactivas, como entornos gráficos, donde es importante que las acciones del usuario tengan una respuesta rápida.

## Funcionamiento de CFS

1. **Asignación de tiempo de CPU:**
   El planificador CFS asigna tiempos de CPU a los procesos en función de su **peso** (que está relacionado con su prioridad). Cada proceso recibe tiempo de CPU proporcional a su peso, lo que permite que los procesos de mayor prioridad reciban más tiempo de CPU.

2. **Cálculo del tiempo de ejecución virtual:**
   El tiempo de ejecución virtual de un proceso se incrementa de acuerdo con el tiempo real que ha estado ejecutándose, pero ponderado por su prioridad. Los procesos con mayor prioridad incrementan su tiempo de ejecución virtual más lentamente, mientras que los de menor prioridad lo hacen más rápido.

3. **Selección del próximo proceso:**
   CFS selecciona el proceso con el **menor tiempo de ejecución virtual** para ejecutarse a continuación. Esto asegura que los procesos que han utilizado menos tiempo de CPU recientemente sean los primeros en ser seleccionados, manteniendo así la equidad en la asignación de CPU.

4. **Período de ejecución:**
   CFS define un **período de ejecución** durante el cual intenta dar tiempo de CPU a todos los procesos en ejecución. Este período es dinámico y se ajusta en función de la cantidad de procesos que necesitan la CPU.





