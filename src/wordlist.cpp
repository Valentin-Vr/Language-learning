#include "wordlist.h"
#include "dictionary.h"

#include <QFile>

WordList::WordList(QObject *parent) : QAbstractListModel(parent)
{
    scanFile();
    m_watcher.addPath(Dictionary::getPath());
    QObject::connect(&m_watcher, &QFileSystemWatcher::fileChanged, this, &WordList::updateData);
    updateData();
}

int WordList::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return m_data.size();
}

QVariant WordList::data(const QModelIndex &index, int Role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (Role) {
    case EngWord:
        return m_data[index.row()].m_engWord;
    case RusWord:
        return m_data[index.row()].m_rusWords;
    case Date:
        return m_data[index.row()].m_date;
    case RepetitionValue:
        return m_data[index.row()].m_repetitionValue;
        //    case TheNeedForRepetition:
        //        return m_data[index.row()].m_theNeedForRepetition;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> WordList::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[EngWord] = "engWord";
    roles[RusWord] = "rusWord";
    roles[Date] = "date";
    roles[RepetitionValue] = "repetitionValue";
    //    roles[TheNeedForRepetition] = "theNeedForRepetition";
    return roles;
}

void WordList::scanFile()
{
    //Сканирование файла и добавление содержимого в m_data
    QFile mFile(Dictionary::getPath());
    if(!mFile.exists()) {
        qDebug() << "Файл не существует";
    } else {
        mFile.open(QIODevice::ReadOnly | QIODevice::Text);
    }
    QTextStream file(&mFile);
    while (!file.atEnd()) {
        QString line = file.readLine();
        QStringList valueString = line.split('*');
        Data addToDictionary(valueString[2],
                valueString[3],
                QDate::fromString(valueString[0], "ddMMyyyy"),
                valueString[1].toInt());
        m_data.push_back(addToDictionary);
    }
    mFile.close();
}

void WordList::updateData()
{
    //Обновление данных m_data
    m_data.clear();
    scanFile();
    qDebug() << "Количество слов m_data" << m_data.size();
    beginResetModel();
    endResetModel();
}
