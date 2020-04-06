#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QDate>
#include <QDebug>

struct Data
{
    Data(QString currentEngWord,
         QString currentRusWords,
         QDate realDate,
         int valueForRepetition/*,
         int theNeedForRepetition*/)
    {
        m_engWord = currentEngWord;
        m_rusWords = currentRusWords;
        m_date = realDate;
        m_repetitionValue = valueForRepetition;
//        m_theNeedForRepetition = theNeedForRepetition;
    }

    QString m_engWord;
    QString m_rusWords;
    QDate m_date;
    int m_repetitionValue;
    int m_theNeedForRepetition;

private:


};

#endif
