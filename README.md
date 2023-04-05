[**THE MACHINE LEARNING CANVAS (V1.0)**](https://ml-ops.org/content/phase-zero#machine-learning-canvas)

**1. Value Proposition**
- Who is the end-user?
_Пользователи системы - финансовые аналитики компании, ответственные за онлайн-платежи._

- Which of their objectives are we serving?
_Автоматизировать обнаружение фактов мошенничества._

- How will they benefit from the ML systems? Mention workflow and interfaces.
_Исключив ручные операции мы снижаем нагрузку на сотрудников, ускоряем выполнение операций и повышаем качество обнаружения мошенничества._

**2. Data Sources**
- Which raw data sources can we use (internal, external)? Mention databases and tables, or APIs and methods of interest.
_1. При проведении транзакции системой вся информация о ней сохраняется в виде csv-файлов, каждая строка которых соответствует одной транзакции. Информация о транзакциях **некоторого фиксированного периода** помещается в отдельный файл. **Уточнить с какой периодочностью необходимо запускать обработку данных. Что подразумевается под "реальным временем"**._
_2. Данные конфиденциальны. При обработке необходимо выполнять обезличивание._
_3. Объём данных в секунду = количество транзакций * объём одной транзакции. В среднем, компания обрабатывает около 50 транзакций в секунду, однако, перед праздниками это число может достигать 400. **Уточнить поля, типы данных и в целом объём данных в одной транзакции**._


**3. Prediction Task**
- Type of task:
_Тип задачи - задача бинарной классификации (легитимная/мошенническая транзакция)_

- Input object:
_См. п.п. 2.1-2.3_

- Output definition, parameters, and possible values:
_Результат бинарный - должен быть записан в таблицу транзакций. **Уточнить интерфейс у заказчика.**_


**4. Features (Engineering)**
- Input representations available at prediction time, extracted from raw data sources.
_**После уточнения типов данных в исходном csv**_


**5. Offline Evaluation**
- Which test data to use to simulate decisions from predictions?
_Здесь про Train/Test split и про выбор метрики (Precision, Recall, F-1 measure, Accuracy)_

- Cost/gain values?
_**Здесь про стоимость ошибок первого и второго рода:**_
_**Ошибка первого рода = False Positive (не более 5% заблокированных нормальных транзакций)**: Если система определит корректную транзакцию как мошенническую, эта транзакция будет отклонена, а пользователь будет недоволен. Опыт бизнес-аналитиков подсказывает, что если доля таких транзакций превысит 5 %, то начнется отток клиентов из компании._
_**Ошибка второго рода = False Negative (пропущено плохих транзакций не более 2% по количеству и не более 500т.р. в мес по сумме)**: Из открытых источников известно, что у ближайших конкурентов на каждую сотню проводимых их клиентами транзакций фиксируется не более двух мошеннических, приводящих к потере денежных средств. При этом общий ущерб клиентов за месяц не превышает 500 тыс. руб. Разрабатываемая система должна выдавать результаты не хуже, иначе компания станет неконкурентоспособной._
_И про бюджет проекта: не более 10 млн. руб. (не считая зарплат специалистам)?_

- Deployment criteria (min performance value, fairness)?
TODO

**6. Decisions**
- Process for turning predictions into proposed value for the end-user? Mention decision-making parameters.
_При срабатывании алгоритма система онлайн-платежей должна отклонить подозрительную операцию._


**7. Making Predictions**
- When do we make real-time / batch predictions?
_См. п.2 "..модуль на базе машинного обучения, способный в реальном времени оценивать, является
ли проводимая транзакция мошеннической". Уточнить с какой периодочностью необходимо запускать обработку данных. Что подразумевается под **"реальным временем"**.
(Are predictions made on the fly for each data point or for a batch of the input data?)
В среднем, компания обрабатывает около 50 транзакций в секунду, однако, перед праздниками это число может достигать 400._

- Time available for this + fearurization + post-processing?
_В среднем, компания обрабатывает около 50 транзакций в секунду, однако, перед праздниками это число может достигать 400._

- Compute target?
_Не использовать вычислительные ресурсы из ифраструктуры заказчика_


**8. Collecting Data**
- Strategy for initial train set
_1. При проведении транзакции системой вся информация о ней сохраняется в виде csv-файлов, каждая строка которых соответствует одной транзакции. Информация о транзакциях некоторого фиксированного периода помещается в отдельный файл._
_2. Данные конфиденциальны_

- Output acquisition cost?
TODO

- Continuous update rate?
TODO

- Holdout ratio on prod inputs?
TODO


**9. Building Models**
- How many prod models are needed?
TODO

- When would we update?
TODO

- Time available for this (including featurization and analysis)?
TODO


**10. Live Evaluation and Monitoring**
- Metrics to quantify value creation and measure the ML system's impact in production (on end-users and business)?
TODO: Аргументированно выбрать метрику машинного обучения, оптимизация которой, позволит достичь поставленных целей.
_1. Доля ложно-положительных срабатываний не должна превышать 5%_
_2. Известно, что на каждую сотню проводимых их клиентами транзакций фиксируется не более двух мошеннических, приводящих к потере денежных средств. При этом общий ущерб клиентов за месяц не превышает 500 тыс. руб. Разрабатываемая система должна выдавать результаты не хуже._




s3a://hadoop-lab-bucket

