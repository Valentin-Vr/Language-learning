#ifndef WORDLIST_H
#define WORDLIST_H

#include <QAbstractListModel>
#include <QFileSystemWatcher>

#include "data.h"

class WordList : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        EngWord,
        RusWord,
        Date,
        RepetitionValue/*,
        TheNeedForRepetition*/
    };

    explicit WordList(QObject *parent = nullptr);


    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int Role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
        QList<Data> m_data;
        QFileSystemWatcher m_watcher;

        void scanFile();

private slots:
        void updateData();

};

#endif // WORDLIST_H
