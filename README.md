## Dosya tipleri
* ***-*** Düzenli
* ***b*** Blok
* ***c*** Karakter
* ***C*** Yüksek performanslı ("birleşik veri")
* ***d*** Dizin
* ***D*** Kapı IPC dosyası
* ***l*** Sembolik link
* ***M*** Off-line göç etmiş
* ***n*** Network (HP-UX)
* ***p*** FIFO
* ***P*** Port
* ***s*** Socket
* ***?*** Diğer dosya tipi

## Ekrana çıktı vermek
```
world="World"
echo "Hello $world
```

* Hello World

## For döngüsü

```
arr=(a b c d e f)
for i in"${arr[@]}";
do
echo"$i"
done
```
* Dizi elemanlarını ekrana yazar.

## While döngüsü
```
i=0
while [ $i -lt ${#arr[@]} ];do
echo "${arr[$i]}"
i=$(expr $i + 1)
done
```
