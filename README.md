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

```
ls -lt | head
```
* en son değişiklik yapılan ilk on dosyayı  listeler.

```
files=( * )
# iterate over them
for file in "${files[@]}"; do
 echo "$file"
done
```
* Dizindeki dosyaları listeler.

## Prosesleri listeleme

```
ps -ef # tüm prosesler
ps aux # tüm prosesler alternatif
```

## Yönlendirmeler
```
ls >file.txt
> file.txt ls
```
* İki kod da ls çıktısını belirtilen dosyaya aktarır.Yoksa oluşturur, varsa üzerine yazar. Varsayılan yönlendirme 1 ile gösterilir.

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

##Dosya okuma
```
cat < file.txt #  ya da
printf "birinci satır\nikinci satır\n" | cat -n
```
