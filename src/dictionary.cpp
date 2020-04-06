#include "dictionary.h"

Dictionary::Dictionary(QObject *parent) : QObject(parent)
{
    //Считывание данных из файла
    QDate currentDate(QDate::currentDate());
    QFile mFile(getPath());
    if(!mFile.exists()) {
        qDebug() << "Файл не существует";
    } else {
        mFile.open(QIODevice::ReadOnly | QIODevice::Text);
    }
    QTextStream file(&mFile);
    while (!file.atEnd()) {
        QString line = file.readLine();
        QStringList valueString = line.split('*');
        QDate date = QDate::fromString(valueString[0], "ddMMyyyy");
        int dayDifference = static_cast<int>(date.daysTo(currentDate));
        int repetitionValue = valueString[1].toInt();
        if (repetitionValue == 1 ||
                dayDifference == 0 ||
                dayDifference == 1 ||
                dayDifference == 3 ||
                dayDifference == 7 ||
                dayDifference == 14 ||
                dayDifference == 30) {
            Data addToDictionary(valueString[2],
                    valueString[3],
                    QDate::fromString(valueString[0], "ddMMyyyy"),
                    valueString[1].toInt());
            m_dictionary.push_back(addToDictionary);
        }
    }
    qDebug() << "Количество слов m_dictionary =" << m_dictionary.size();
    mFile.close();
}

void Dictionary::writeToFile(QString engWord, QString rusWord)
{
    //Запись в файл нового слова
    if (wordCheck(engWord, rusWord) == true) {
        QDate currentDate(QDate::currentDate());
        int repetitionValue = 0;
        QFile mFile(getPath());
        if(!mFile.exists()) {
            qDebug() << "Файл не существует";
        } else {
            mFile.open(QIODevice::Append | QIODevice::Text);
            QTextStream writeStream(&mFile);
            writeStream << currentDate.toString("ddMMyyyy") << "*" << repetitionValue << "*" << engWord << "*" << rusWord << "*" << "\n";
            mFile.close();
        }
        Data newData(engWord, rusWord, currentDate, repetitionValue);
        m_dictionary.push_back(newData);
    }
    qDebug() << "Количество слов =" << m_dictionary.size();
}

QString Dictionary::openFile()
{
    //Открытие блокнота
    QProcess process;
    process.start("notepad C:/Users/User/Documents/Project1_1/dictionary.txt");
    process.waitForFinished();
    //Открытие файла в Label (не модель MVC)
    //    QFile mFile(PATH);
    //    if(!mFile.exists()) {
    //        qDebug() << "Файл не существует";
    //    } else {
    //        mFile.open(QIODevice::ReadOnly);
    //    }
    //    QByteArray data;
    //    data = mFile.readAll();
    //    mFile.close();
    //    return QString(data);
}

QString Dictionary::engWord(int nextWord)
{
    //Открытие следующего английского слова
    if (m_dictionary.size() != 0) {
        if (nextWord > m_dictionary.size() - 1) {
            nextWord = 0;
            randomShuffle();
        }
        setLineCount(nextWord);
        return m_dictionary[nextWord].m_engWord;
    }
    return "Слов нет";
}

QString Dictionary::rusWord(int nextWord)
{
    //Открытие русского слова для данного английского
//    if (m_dictionary.size() != 0) {
//        return m_dictionary[nextWord].m_rusWords;
//    }
//    return "Слов нет";
    if (m_dictionary.size() != 0) {
        if (nextWord > m_dictionary.size() - 1) {
            nextWord = 0;
            randomShuffle();
        }
        setLineCount(nextWord);
        return m_dictionary[nextWord].m_rusWords;
    }
    return "Слов нет";
}

int Dictionary::numberOfLines()
{
    int numberOfLines = 0;
    QFile mFile(getPath());
    if(!mFile.exists()) {
        qDebug() << "Файл не существует";
    } else {
        mFile.open(QIODevice::Append | QIODevice::Text);
        QTextStream file(&mFile);
        while (!file.atEnd()) {
            numberOfLines++;
        }
        mFile.close();
    }
    qDebug() << "numberOfLines" << numberOfLines;
    return numberOfLines;
}

void Dictionary::numberOfRepetition()
{

}


int Dictionary::lineCount() const
{
    return m_lineCount;
}

QString Dictionary::getPath()
{
    return "C:/Users/User/Documents/Project1_1/dictionary.txt";
}

QList<Data> Dictionary::getDictionary()
{
    return m_dictionary;
}

void Dictionary::randomShuffle()
{
    //Пересортировка слов в словаре после первого и последующих кругов повторения
    if (m_dictionary.size() > 3) {
        QList<Data> temporaryList;
        int i = 0;
        while(i * 2 < m_dictionary.size()) {
            Data temporary(m_dictionary[i * 2].m_engWord,
                    m_dictionary[i * 2].m_rusWords,
                    m_dictionary[i * 2].m_date,
                    m_dictionary[i * 2].m_repetitionValue);
            temporaryList.push_back(temporary);
            i++;
        }
        i = 0;
        while(i * 2 + 1 < m_dictionary.size()) {
            Data temporary(m_dictionary[i * 2 + 1].m_engWord,
                    m_dictionary[i * 2 + 1].m_rusWords,
                    m_dictionary[i * 2 + 1].m_date,
                    m_dictionary[i * 2 + 1].m_repetitionValue);
            temporaryList.push_back(temporary);
            i++;
        }
        for (int i = 0; i < temporaryList.size(); i++) {
            m_dictionary[i] = temporaryList[i];
        }
    }
}

bool Dictionary::wordCheck(QString engWord, QString rusWord)
{
    //Проверка нового слова на необходимость добавления в словарь
    if ((engWord.size() > 1 && rusWord.size() > 1) || (engWord.size() == 1 && engWord[0] == QChar('i'))) {
        //Проверка на наличие символа "*" в engWord
        for (int i = 0; i < engWord.size(); i++) {
            if (engWord[i] == QChar('*')) {
                return false;
            }
        }
        //Проверка на наличие символа "*" в rusWord
        for (int i = 0; i < rusWord.size(); i++) {
            if (rusWord[i] == QChar('*')) {
                return false;
            }
        }
        //Проверка на наличие engWord в словаре
        QFile mFile(getPath());
        if(!mFile.exists()) {
            qDebug() << "Файл не существует";
        } else {
            mFile.open(QIODevice::ReadOnly | QIODevice::Text);
        }
        QTextStream file(&mFile);
        while (!file.atEnd()) {
            QString line = file.readLine();
            QStringList valueString = line.split('*');
            if (engWord == valueString[2]) {
                mFile.close();
                return false;
            }
        }
        mFile.close();
        return true;
    }
    return false;
}

void Dictionary::setLineCount(int lineCount)
{
    if (m_lineCount == lineCount)
        return;

    m_lineCount = lineCount;
    emit lineCountChanged(m_lineCount);
}

