# Αρχιτεκτονική Υπολογιστών Εργαστήριο Μέρος 3

Ομάδα 3

* Φίλιππος Τόλιας 10252
* Χρήστος-Μάριος Περδίκης 10075

### Βήμα 1ο 

#### 1. Κοιτάζοντας τα αποτελέσματα που σας δίνει η έξοδος του McPAT, θα δείτε αποτελέσματα για dynamic power και leakage. Ανατρέξτε στη βιβλιογραφία και προσπαθήστε να εξηγήσετε τί είναι το ένα και τί είναι το άλλο. Αν τρέξετε διαφορετικά προγράμματα σε έναν επεξεργαστή ποιο θα επηρεαστεί και πώς; Έχει σημασία πόσο μεγάλο (σε χρονική διάρκεια εκτέλεσης) είναι ένα πρόγραμμα;

Ανατρέχοντας στην 1η διαφάνεια βλέπουμε πως Dynamic Power να ορίζεται ως `1/2 * Capacitive Load * Voltage^2 * Frequency switched`. Από το βιβλίο Computer Architecture: A Quantitative
Approach, 6th Edition των Henessey και Patterson, βλέπουμε ότι `Dynamic Power = Dynamic Energy * Frequency switched` όπου `Dynamic Energy = 1/2 * Capacitance * Voltage^2` είναι η ενέργεια 
που απαιτεί ένα transistor να αλλάξει λογική κατάσταση από 1 στο 0 (ή αντίστροφα από το 0 στο 1). Προφανώς εξαρτάται από την χωρητικότητα (υλικό καλωδίων και τρανζίστορ), την τάση τροφοδοσίας
των τρανζίστορ μας και από την συχνότητα αλλαγής της κατάστασης του τρανζίστορ. Αν έχουμε μεταβλητή συχνότητα επεξεργαστή λόγω overclocking, τότε το Dynamic Power έμμεσα εξαρτάται από το
πόσο απαιτητικό είναι το πρόγραμμα που τρέχει ανά πάσα στιγμή, όσο πιο απαιτητικό, τόσο αυξάνεται η κατανάλωση λόγω Dynamic Power. 

Το leakage αναφέρεται στην ισχύ που καταναλώνεται ακόμα και όταν ένα τρανζίστορ είναι idle (static power). Όσο μεγαλύτερος ο αριθμός και μικρότερες οι διαστάσεις των τρανζίστορ, τόσο περισσότερο leakage
έχουμε. Σε αντίθεση με το dynamic power, εξαρτάται μόνο από την κατασκευή του επεξεργαστή μας και είναι τελείως ανεξάρτητο από το πρόγραμμα που τρέχει ανά πάσα στιγμή.

Συμπεραίνουμε ότι έχει σημασία αν τρέξουμε ένα πρόγραμμα για πολλή ώρα, καθώς θα καταναλώνει dynamic power + static power για μεγαλύτερο χρονικό διάστημα και άρα περισσότερη ενέργεια συνολικά.
Αν το πρόγραμμά μας εκτελείται σε πολύ λίγο χρόνο, βρισκόμαστε για περισσότερη ώρα στην idle κατάσταση και εξοικονομούμε ενέργεια. Αυτό πάντα εξαρτάται και στο αν είναι αμελητέα η διαφορά
μεταξύ static power και dynamic power.

Τρέχοντας διάφορα προγράμματα στον επεξεργαστή η `leakage power` θα παραμείνει σταθερή ενώ η `dynamic power` θα είναι μεγαλύτερη για πιο "βαριά" προγράμματα. Αυτό συμβαίνει επειδή οι επεξεργαστές χρησιμοποιούν Dynamic Voltage-Frequency Scaling το οποίο αλλάζει τη συχνότητα του επεξεργαστή ώστε στα "ελαφριά" προγράμματα να τα τρέχει με πιο χαμηλή συχνότητα με αποτέλεσμα να μειώνεται και η απαιτουμενη `dynamic power`.

Αν τρέξουμε προγράμματα τα οποία διαφέρουν μόνο στον χρόνο εκτέλεσης τότε το dynamic και leakage power θα είναι ίδια αλλά η συνολική ενεργεία που καταναλώνει το μεγαλύτερο πρόγραμμα είναι περισσότερη αφού εκτελείται για περισσότερη ώρα και καταναλώνει ίδια ισχύ.

#### 2. Έστω ότι έχετε ένα σύστημα που τροφοδοτείται από μπαταρία συγκεκριμένης χωρητικότητας και έχετε την επιλογή να βάλετε στο σύστημα αυτό δύο διαφορετικούς επεξεργαστές. Έστω ότι ο ένας καταναλώνει 5 Watt και ο άλλος 50 Watt. Υπάρχει περίπτωση ο δεύτερος επεξεργαστής να δίνει στο σύστημα μεγαλύτερη διάρκεια μπαταρίας; To ΜcPAT μπορεί να μας δώσει τη σχετική απάντηση με τα αποτελέσματα που παράγει; Αν ναι γιατί και αν όχι τι άλλο θα χρειαζόμασταν για να μπορέσουμε να απαντήσουμε;

Ο δεύτερος επεξεργαστής μπορεί θεωρητικά να δώσει μεγαλύτερη διάρκεια μπαταρίας είναι αν έχει τεράστια βελτίωση στην απόδοση σε σχέση με τον πρώτο και μετά από την εκτέλεση 
κάθε προγράμματος να τον απενεργοποιούμε μέχρι την εκτέλεση του επόμενου προγράμματος. Επίσης θα μπορούσε να δώσει μεγαλύτερη διάρκεια μπαταρίας ξανά αν είχε πολύ μεγάλη διαφορά στην 
απόδοση με τον πρώτο και είχε πάρα πολυ μικρό leakage σε σχέση με τον πρώτο.

Τα αποτελέσματα του McPAT δεν μπορούν να μας δώσουν απάντηση σε αυτή την ερώτηση. Η γνώση της κατανάλωσης ισχύος είναι απαραίτητες, αλλά δεν ξέρουμε πόσο χρόνο χρειάζεται ο κάθε 
επεξεργαστής για να τρέξει ένα πρόγραμμα.

#### 3. Τρέξτε το McPAT για τον Xeon (Xeon.xml) και για τον ARM A9 (ARM_A9_2GHz.xml). Ας κάνουμε μια εντελώς αυθαίρετη υπόθεση και ας υποθέσουμε ότι o Xeon μπορεί να τρέξει την ίδια εφαρμογή με τον Α9, 50 φορές γρηγορότερα. Υποθέτοντας ότι δεν διακόπτεται η λειτουργία του συστήματος μετά την ολοκλήρωση εκτέλεσης της εφαρμογής (δλδ δεν απενεργοποιείται με κάποιο τρόπο το σύστημα), εξηγείστε χρησιμοποιώντας το McPAT γιατί o Xeon δεν μπορεί να είναι πιο energy efficient από τον A9 παρά τη διαφορά στην απόδοση.

Όσο γρήγορα και να τρέξει το πρόγραμμα ο Xeon θα καταναλώσει περισσότερη ενέργεια από τον ARM A9, καθώς το Leakage του Xeon είναι πολύ μεγαλύτερο από το Peak Power του A9, που σημαίνει ότι
και στην μεγαλύτερη κατανάλωσή του ο ARM A9 καταναλώνει πολύ λιγότερη ενέργεια από αυτή που χρειάζεται ο Xeon για να μείνει απλά ανοιχτός και idle!

Xeon:

* `Peak Power` = 134.938 W
* `Total Leakage` = 36.8319 W

A9:

* `Peak Power` = 1.74189 W
* `Total Leakage` = 0.108687 W


### Βήμα 2ο

#### 1. Υπολογίστε την κατανάλωση ενέργειας για όλες τις περιπτώσεις.

Η κατανάλωση ενέργειας υπολογίστηκε πολλαπλασιάζοντας το Peak Power που κατανάλωσε ο επεξεργαστής για κάθε περίπτωση από το αρχείο απoτελεσμάτων του McPAT με τον συνολικό
χρόνο που έτρεξε η προσωμείωση σε δευτερόλεπτα από τα αποτελέσματα του GEM5. Δηλαδή, `Peak Power * sim_seconds = Total Energy consumed`. Ακολουθούν τα αποτελέσματα αυτής 
της πράξης για όλες τις περιπτώσεις.

Σημείωση: Χρησιμοποιήσαμε το Peak Power καθώς το άθροισμα των Runtime Dynamic Power, Subthreshold Leakage και Gate Leakage είναι περίπου ίσο με το Peak Power στην πλειοψηφία 
των περιπτώσεων.

#### specbzip
```
cache_line 128: 0.76906859038  
cache_line 256: 2.2616846580  
cache_line 32: 0.20614782916  
cache_line 512: 8.1842831226  
cache_line 64: 0.32470468299  
l1d_assoc 1: 0.33045186330  
l1d_assoc 16: 0.36459475764  
l1d_assoc 2: 0.32470468299  
l1d_assoc 4: 0.29936689009  
l1d_assoc 8: 0.31848914212  
l1d_size 128kB: 0.36004160448  
l1d_size 16kB: 0.25829783018  
l1d_size 2kB: 0.28438953825  
l1d_size 32kB: 0.25458078950  
l1d_size 4kB: 0.26788131122  
l1d_size 64kB: 0.32470468299  
l1d_size 8kB: 0.26270320056  
l1i_assoc 1: 0.32217984448  
l1i_assoc 16: 0.4439116846  
l1i_assoc 2: 0.32470468299  
l1i_assoc 4: 0.3587681289  
l1i_assoc 8: 0.38858561430  
l1i_size 128kB: 0.45394469578  
l1i_size 16kB: 0.32305307194  
l1i_size 2kB: 0.32374351612  
l1i_size 32kB: 0.32470468299  
l1i_size 4kB: 0.3227107250  
l1i_size 64kB: 0.408625945  
l1i_size 8kB: 0.32274470277  
l2_assoc 1: 0.32968413884  
l2_assoc 16: 0.32501378550  
l2_assoc 2: 0.32629973592  
l2_assoc 4: 0.32450018874  
l2_assoc 8: 0.32470468299  
l2_size 128kB: 0.36094277322  
l2_size 1MB: 0.32158148372  
l2_size 256kB: 0.34146414540  
l2_size 2MB: 0.32470081732  
l2_size 32kB: 0.38312487642  
l2_size 4MB: 0.33003351522  
l2_size 512kB: 0.32531526416  
l2_size 64kB: 0.37234357650  
```

#### spechmmer
```
cache_line 128: 0.54556405890  
cache_line 256: 1.6055702924  
cache_line 32: 0.13313955109  
cache_line 512: 5.7403308528  
cache_line 64: 0.22960920099  
l1d_assoc 1: 0.23394941765  
l1d_assoc 16: 0.26174779357  
l1d_assoc 2: 0.22959760398  
l1d_assoc 4: 0.21366541352  
l1d_assoc 8: 0.22814208108  
l1d_size 128kB: 0.25874063928  
l1d_size 16kB: 0.17714751558  
l1d_size 2kB: 0.22265976690  
l1d_size 32kB: 0.17773065888  
l1d_size 4kB: 0.19197781184  
l1d_size 64kB: 0.22959760398  
l1d_size 8kB: 0.17804590395  
l1i_assoc 1: 0.25256515648  
l1i_assoc 16: 0.3138365402  
l1i_assoc 2: 0.22959373831  
l1i_assoc 4: 0.2536350024  
l1i_assoc 8: 0.27473035317  
l1i_size 128kB: 0.32096155202  
l1i_size 16kB: 0.22865022560  
l1i_size 2kB: 0.24154272928  
l1i_size 32kB: 0.22959760398  
l1i_size 4kB: 0.2349432625  
l1i_size 64kB: 0.288888565  
l1i_size 8kB: 0.22846728534  
l2_assoc 1: 0.22945802808  
l2_assoc 16: 0.22967125254  
l2_assoc 2: 0.22955305848  
l2_assoc 4: 0.22955959182  
l2_assoc 8: 0.22959760398  
l2_size 128kB: 0.21758668358  
l2_size 1MB: 0.22330282576  
l2_size 256kB: 0.21744111732  
l2_size 2MB: 0.22960920099  
l2_size 32kB: 0.22218302106  
l2_size 4MB: 0.23705233200  
l2_size 512kB: 0.21924896400  
l2_size 64kB: 0.22005328905  
```

#### speclibm
```
cache_line 128: 1.19112281590  
cache_line 256: 2.7079273112  
cache_line 32: 0.62412183491  
cache_line 512: 8.2751775210  
cache_line 64: 0.67526683261  
l1d_assoc 1: 0.67749774586  
l1d_assoc 16: 0.77000124289  
l1d_assoc 2: 0.67529775797  
l1d_assoc 4: 0.62854345873  
l1d_assoc 8: 0.67115234054  
l1d_size 128kB: 0.76211743806  
l1d_size 16kB: 0.51851311110  
l1d_size 2kB: 0.51617979165  
l1d_size 32kB: 0.52269546076  
l1d_size 4kB: 0.51650511430  
l1d_size 64kB: 0.67526296694  
l1d_size 8kB: 0.51712512743  
l1i_assoc 1: 0.66990425216  
l1i_assoc 16: 0.9230610820  
l1i_assoc 2: 0.67529775797  
l1i_assoc 4: 0.7461227301  
l1i_assoc 8: 0.80812298190  
l1i_size 128kB: 0.94408086980  
l1i_size 16kB: 0.67185622144  
l1i_size 2kB: 0.66997726572  
l1i_size 32kB: 0.67529775797  
l1i_size 4kB: 0.6702539125  
l1i_size 64kB: 0.849871715  
l1i_size 8kB: 0.67094549886  
l2_assoc 1: 0.67480610440  
l2_assoc 16: 0.67551437481  
l2_assoc 2: 0.67508557640  
l2_assoc 4: 0.67518595573  
l2_assoc 8: 0.67529775797  
l2_size 128kB: 0.64003356294  
l2_size 1MB: 0.65709213724  
l2_size 256kB: 0.64001695268  
l2_size 2MB: 0.67721126462  
l2_size 32kB: 0.62650054038  
l2_size 4MB: 0.69619157100  
l2_size 512kB: 0.64525265390  
l2_size 64kB: 0.63023985135  
```

#### specmcf
```
cache_line 128: 0.61486356864  
cache_line 256: 1.7663068852  
cache_line 32: 0.13951461461  
cache_line 512: 6.7002572718  
cache_line 64: 0.25094769939  
l1d_assoc 1: 0.25093724565  
l1d_assoc 16: 0.28603030868  
l1d_assoc 2: 0.25094769939  
l1d_assoc 4: 0.23349055882  
l1d_assoc 8: 0.24931501242  
l1d_size 128kB: 0.28314972198  
l1d_size 16kB: 0.19617064529  
l1d_size 2kB: 0.23684009205  
l1d_size 32kB: 0.19380661896  
l1d_size 4kB: 0.20629454060  
l1d_size 64kB: 0.25094769939  
l1d_size 8kB: 0.20083791141  
l1i_assoc 1: 0.25594424960  
l1i_assoc 16: 0.3051486578  
l1i_assoc 2: 0.25094769939  
l1i_assoc 4: 0.2466047718  
l1i_assoc 8: 0.26712889866  
l1i_size 128kB: 0.31207042572  
l1i_size 16kB: 0.26948721744  
l1i_size 2kB: 0.61253760068  
l1i_size 32kB: 0.25094769939  
l1i_size 4kB: 0.4985718375  
l1i_size 64kB: 0.280895370  
l1i_size 8kB: 0.37153298784  
l2_assoc 1: 0.25137077912  
l2_assoc 16: 0.25102819647  
l2_assoc 2: 0.25091447132  
l2_assoc 4: 0.25089842245  
l2_assoc 8: 0.25094769939  
l2_size 128kB: 0.23793093516  
l2_size 1MB: 0.24489397884  
l2_size 256kB: 0.23965998812  
l2_size 2MB: 0.25094769939  
l2_size 32kB: 0.23661343134  
l2_size 4MB: 0.25897767732  
l2_size 512kB: 0.24111849450  
l2_size 64kB: 0.23673834360  
```

#### specsjeng
```
cache_line 128: 3.13751707648  
cache_line 256: 7.0406871876  
cache_line 32: 1.96500203354  
cache_line 512: 19.1508476646  
cache_line 64: 1.98514524644  
l1d_assoc 1: 1.98642919761  
l1d_assoc 16: 2.26351476754  
l1d_assoc 2: 1.98514524644  
l1d_assoc 4: 1.84771073802  
l1d_assoc 8: 1.97293608044  
l1d_size 128kB: 2.24039169108  
l1d_size 16kB: 1.52430803812  
l1d_size 2kB: 1.51943410245  
l1d_size 32kB: 1.53224665836  
l1d_size 4kB: 1.51908711992  
l1d_size 64kB: 1.98514524644  
l1d_size 8kB: 1.52048862965  
l1i_assoc 1: 1.96962773696  
l1i_assoc 16: 2.7137794996  
l1i_assoc 2: 1.98514524644  
l1i_assoc 4: 2.1933678807  
l1i_assoc 8: 2.37592413123  
l1i_size 128kB: 2.77556640856  
l1i_size 16kB: 1.97546255308  
l1i_size 2kB: 1.96997643780  
l1i_size 32kB: 1.98514524644  
l1i_size 4kB: 1.9706944000  
l1i_size 64kB: 2.498265070  
l1i_size 8kB: 1.97237866812  
l2_assoc 1: 1.98389208640  
l2_assoc 16: 1.98585936432  
l2_assoc 2: 1.98470598856  
l2_assoc 4: 1.98479726081  
l2_assoc 8: 1.98514524644  
l2_size 128kB: 1.88765358360  
l2_size 1MB: 1.93113934916  
l2_size 256kB: 1.88034606536  
l2_size 2MB: 1.98514524644  
l2_size 32kB: 1.83790004970  
l2_size 4MB: 2.04824389032  
l2_size 512kB: 1.89593142430  
l2_size 64kB: 1.84722244875  
```



#### 2. Παρουσιάστε με σχετικά γραφήματα τα αποτελέσματα σας. Δείξτε την επίδραση κάθε παραμέτρου που αλλάξατε στη προηγούμενη άσκηση (cache size, associativity, block size) σε σχέση με το power (χρησιμοποιήστε το peak power για αυτά τα γραφήματα).

![cache line size to peak power diagram](/benchmarks/cache_line.png)

![l1d association to peak power diagram](/benchmarks/l1d_assoc.png)

![l1d size to peak power diagram](/benchmarks/l1d_size.png)

![l1i association to peak power diagram](/benchmarks/l1i_assoc.png)

![l1i size to peak power diagram](/benchmarks/l1i_size.png)

![l2 association to peak power diagram](/benchmarks/l2_assoc.png)

![l2 size to peak power diagram](/benchmarks/l2_size.png)

#### 3. Αν μπορούσατε να συνδυάσετε χαρακτηριστικά από τις διαφορετικές αρχιτεκτονικές τις οποίες έχετε δει στα πλαίσια των εργαστηρίων, τι θα επιλέγατε από την κάθε μια για δημιουργήσετε την «ιδανική» αρχιτεκτονική?  

Για να υπολογίσουμε την "ιδανική" αρχιτεκτονική θα χρησιμοποιήσουμε το Energy-Delay-Area-Product. Θεωρώντας ότι `energy = peak power * sim_seconds`, `delay = cpi * cpu frequency` και λαμβάνοντας το area από το αρχείο
mcpat_result.txt, έχουμε τα ακόλουθα αποτελέσματα.

#### specbzip
```
cache_line 128: 131251500088.301678  
cache_line 256: 692737910411.873184  
cache_line 32: 10110378703.239900  
cache_line 512: 6117351420400.933228  
cache_line 64: 17405866077.603584  
l1d_assoc 1: 18004736447.881504  
l1d_assoc 16: 20288787644.529717  
l1d_assoc 2: 17405814272.703904  
l1d_assoc 4: 14763513891.856680  
l1d_assoc 8: 15966415938.766860  
l1d_size 128kB: 22118096418.795414  
l1d_size 16kB: 11925500856.906265  
l1d_size 2kB: 14493237998.012709  
l1d_size 32kB: 11576482144.050660  
l1d_size 4kB: 12851803795.739260  
l1d_size 64kB: 17405866077.603584  
l1d_size 8kB: 12348925279.089817  
l1i_assoc 1: 17235046012.501746  
l1i_assoc 16: 28146307975.775561  
l1i_assoc 2: 17405866077.603584  
l1i_assoc 4: 20152623810.250867  
l1i_assoc 8: 22929697526.693400  
l1i_size 128kB: 31659344909.529108  
l1i_size 16kB: 17255168654.562292  
l1i_size 2kB: 17351875958.872509  
l1i_size 32kB: 17405803911.723968  
l1i_size 4kB: 17234971359.289848  
l1i_size 64kB: 25187018875.599175  
l1i_size 8kB: 17230524809.129408  
l2_assoc 1: 18487719127.441314  
l2_assoc 16: 18169573898.515785  
l2_assoc 2: 18337802195.249212  
l2_assoc 4: 18130234480.371200  
l2_assoc 8: 17405866077.603584  
l2_size 128kB: 14198794717.347645  
l2_size 1MB: 14431785518.956663  
l2_size 256kB: 13413000619.958857  
l2_size 2MB: 17405475521.782100  
l2_size 32kB: 15584289266.991432  
l2_size 4MB: 24316497549.310269  
l2_size 512kB: 12703220926.199163  
l2_size 64kB: 14798651847.254897  
```

#### spechmmer
```
cache_line 128: 66049809242.789668  
cache_line 256: 349110744076.285056  
cache_line 32: 4217170485.100185  
cache_line 512: 3009378994497.187760  
cache_line 64: 8703531598.832397  
l1d_assoc 1: 9024338051.328238  
l1d_assoc 16: 10456801571.227699  
l1d_assoc 2: 8702673786.664586  
l1d_assoc 4: 7520567059.539500  
l1d_assoc 8: 8192848505.767077  
l1d_size 128kB: 11422730940.786544  
l1d_size 16kB: 5609254257.584208  
l1d_size 2kB: 8884324012.606774  
l1d_size 32kB: 5642275195.709460  
l1d_size 4kB: 6600588717.458472  
l1d_size 64kB: 8702673786.664586  
l1d_size 8kB: 5672366700.350560  
l1i_assoc 1: 10591550680.442544  
l1i_assoc 16: 14068191680.493192  
l1i_assoc 2: 8702346344.164746  
l1i_assoc 4: 10072031009.079243  
l1i_assoc 8: 11461305465.129280  
l1i_size 128kB: 15827104705.789587  
l1i_size 16kB: 8643927659.002160  
l1i_size 2kB: 9659006667.346024  
l1i_size 32kB: 8702673786.664586  
l1i_size 4kB: 9134999769.742437  
l1i_size 64kB: 12588769952.608483  
l1i_size 8kB: 8634379601.500562  
l2_assoc 1: 8955582496.327927  
l2_assoc 16: 9073133682.340525  
l2_assoc 2: 9075725440.112467  
l2_assoc 4: 9073235769.157181  
l2_assoc 8: 8702673786.664586  
l2_size 128kB: 5159923264.077091  
l2_size 1MB: 6958747153.231014  
l2_size 256kB: 5438979955.652825  
l2_size 2MB: 8703487639.270911  
l2_size 32kB: 5241197226.558936  
l2_size 4MB: 12545015857.553548  
l2_size 512kB: 5770037219.388624  
l2_size 64kB: 5168807379.700122  
```

#### speclibm
```
cache_line 128: 314839532073.850772  
cache_line 256: 993074844513.467937  
cache_line 32: 92672120570.634113  
cache_line 512: 6253958117990.169170  
cache_line 64: 75278068306.760452  
l1d_assoc 1: 75681156083.354737  
l1d_assoc 16: 90493738381.360931  
l1d_assoc 2: 75284864107.943049  
l1d_assoc 4: 65081002873.346924  
l1d_assoc 8: 70902592914.267027  
l1d_size 128kB: 99102285947.405074  
l1d_size 16kB: 48056929956.671816  
l1d_size 2kB: 47746571782.879401  
l1d_size 32kB: 48800673074.626470  
l1d_size 4kB: 47778077078.318730  
l1d_size 64kB: 75277450014.746700  
l1d_size 8kB: 47851192966.432800  
l1i_assoc 1: 74514397185.670416  
l1i_assoc 16: 121700536896.909003  
l1i_assoc 2: 75284864107.943049  
l1i_assoc 4: 87160802647.018458  
l1i_assoc 8: 99169709935.663248  
l1i_size 128kB: 136934455453.663952  
l1i_size 16kB: 74631349284.031948  
l1i_size 2kB: 74312631176.097837  
l1i_size 32kB: 75284864107.943049  
l1i_size 4kB: 74346990607.929249  
l1i_size 64kB: 108950983027.537989  
l1i_size 8kB: 74465792456.921250  
l2_assoc 1: 77454197352.961171  
l2_assoc 16: 78489553319.152721  
l2_assoc 2: 78493233831.092016  
l2_assoc 4: 78490484942.991646  
l2_assoc 8: 75284864107.943049  
l2_size 128kB: 44645800857.555830  
l2_size 1MB: 60254937375.626264  
l2_size 256kB: 47121393884.180969  
l2_size 2MB: 75712218198.843285  
l2_size 32kB: 41672639086.935780  
l2_size 4MB: 108203358709.985976  
l2_size 512kB: 49976059494.159028  
l2_size 64kB: 42397871316.774280  
```

#### specmcf
```
cache_line 128: 83894962000.795898  
cache_line 256: 422513280877.053052  
cache_line 32: 4630700430.219011  
cache_line 512: 4100021604550.083870  
cache_line 64: 10396487840.524227  
l1d_assoc 1: 10382487738.854481  
l1d_assoc 16: 12487054025.722626  
l1d_assoc 2: 10396487840.524227  
l1d_assoc 4: 8980959667.272840  
l1d_assoc 8: 9784046273.286516  
l1d_size 128kB: 13679519023.653667  
l1d_size 16kB: 6878618578.954980  
l1d_size 2kB: 10052007602.427072  
l1d_size 32kB: 6709067085.147984  
l1d_size 4kB: 7621717472.320248  
l1d_size 64kB: 10396487840.524227  
l1d_size 8kB: 7217608935.793984  
l1i_assoc 1: 10876878304.335825  
l1i_assoc 16: 13299992315.893140  
l1i_assoc 2: 10396487840.524227  
l1i_assoc 4: 9521410967.898292  
l1i_assoc 8: 10835833220.113536  
l1i_size 128kB: 14962244561.169444  
l1i_size 16kB: 12007327462.030965  
l1i_size 2kB: 62116815766.363686  
l1i_size 32kB: 10396487840.524227  
l1i_size 4kB: 41137598767.375708  
l1i_size 64kB: 11901781433.037258  
l1i_size 8kB: 22833683673.434592  
l2_assoc 1: 10747733409.730044  
l2_assoc 16: 10839056014.557295  
l2_assoc 2: 10843433925.409440  
l2_assoc 4: 10838516362.426882  
l2_assoc 8: 10396487840.524227  
l2_size 128kB: 6169857817.347285  
l2_size 1MB: 8369382437.063406  
l2_size 256kB: 6607315656.746905  
l2_size 2MB: 10396463818.120758  
l2_size 32kB: 5944095405.281503  
l2_size 4MB: 14972902821.959234  
l2_size 512kB: 6978484096.659345  
l2_size 64kB: 5982288448.101150  
```

#### specsjeng
```
cache_line 128: 2184483974840.829496  
cache_line 256: 6713319880683.328348  
cache_line 32: 918620814553.537721  
cache_line 512: 33494741392065.713606  
cache_line 64: 650583842744.039640  
l1d_assoc 1: 650608263175.619606  
l1d_assoc 16: 781993605332.123184  
l1d_assoc 2: 650583842744.039640  
l1d_assoc 4: 562408991530.152320  
l1d_assoc 8: 612698761656.601984  
l1d_size 128kB: 856423543743.116404  
l1d_size 16kB: 415319051983.499470  
l1d_size 2kB: 413717354989.854652  
l1d_size 32kB: 419359394120.964850  
l1d_size 4kB: 413280906445.043714  
l1d_size 64kB: 650583842744.039640  
l1d_size 8kB: 413682582981.679718  
l1i_assoc 1: 644143106756.275981  
l1i_assoc 16: 1051914701249.480475  
l1i_assoc 2: 650583842744.039640  
l1i_assoc 4: 753224544084.010193  
l1i_assoc 8: 857214860621.100064  
l1i_size 128kB: 1183579361963.754436  
l1i_size 16kB: 645218551750.259168  
l1i_size 2kB: 642488486344.337596  
l1i_size 32kB: 650583842744.039640  
l1i_size 4kB: 642722601561.415056  
l1i_size 64kB: 941462525173.877091  
l1i_size 8kB: 643522036353.209244  
l2_assoc 1: 669456526228.921516  
l2_assoc 16: 678329522845.312595  
l2_assoc 2: 678433189749.165264  
l2_assoc 4: 678271953054.484735  
l2_assoc 8: 650583842744.039640  
l2_size 128kB: 388347478130.752922  
l2_size 1MB: 520437104056.193688  
l2_size 256kB: 406734571535.047922  
l2_size 2MB: 650583842744.039640  
l2_size 32kB: 358634621536.755408  
l2_size 4MB: 936586752745.042951  
l2_size 512kB: 431468576376.391566  
l2_size 64kB: 364226636582.423160  
```

Με βάση αυτά τα αποτελέσματα θα αποφασίσουμε ποιά είναι η βέλτιστη από τις 4 
προσωμειώσεις του 2ου εργαστηρίου. Στους ακόλουθες πίνακες φαίνεται το EADP
με βάση το benchmark και όλες τις παραμέτρους της κάθε αρχιτεκτονικής.

* Simulation 1:

  `Cache Line Size = 128`  
  `L2 associativity = 1`  
  `L2 size = 32kB`  
  `L1d associativity = 4`  
  `L1d size = 8kB`  
  `L1i associativity = 2`  
  `L1i size = 32kB`

|         | Specbzip | Spechmmer | Specmcf | Specsjeng | Speclibm |
| ------- | -------  | --------- | ------- | --------- | -------  |
| Cache Line Size | 131251500088.301678 | 66049809242.789668 | 83894962000.795898 | 2184483974840.829496 | 314839532073.850772 |
| L2 associativity | 18487719127.441314 | 8955582496.327927 | 10747733409.730044 | 669456526228.921516 | 77454197352.961171 |
| L2 size | 15584289266.991432 | 5241197226.558936 | 5944095405.281503 | 358634621536.755408 | 41672639086.935780 |
| L1d associativity | 14763513891.856680 | 7520567059.539500 | 8980959667.272840 | 562408991530.152320 | 65081002873.346924 |
| L1d size | 12348925279.089817 | 5672366700.350560 | 7217608935.793984 | 413682582981.679718 | 47851192966.432800 |
| L1i associativity | 17405866077.603584 | 8702346344.164746 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |
| L1i size | 17405803911.723968 | 8702673786.664586 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |


* Simulation 2:

  `Cache Line Size = 128`  
  `L2 associativity = 1`  
  `L2 size = 256kB`  
  `L1d associativity = 4`  
  `L1d size = 8kB`  
  `L1i associativity = 2`  
  `L1i size = 32kB`  

|         | Specbzip | Spechmmer | Specmcf | Specsjeng | Speclibm |
| ------- | -------  | --------- | ------- | --------- | -------  |
| Cache Line Size | 131251500088.301678 | 66049809242.789668 | 83894962000.795898 | 2184483974840.829496 | 314839532073.850772 |
| L2 associativity | 18487719127.441314 | 8955582496.327927 | 10747733409.730044 | 669456526228.921516 | 77454197352.961171 |
| L2 size | 13413000619.958857 | 5438979955.652825 | 6607315656.746905 | 406734571535.047922 | 47121393884.180969 |
| L1d associativity | 14763513891.856680 | 7520567059.539500 | 8980959667.272840 | 562408991530.152320 | 65081002873.346924 |
| L1d size | 12348925279.089817 | 5672366700.350560 | 7217608935.793984 | 413682582981.679718 | 47851192966.432800 |
| L1i associativity | 17405866077.603584 | 8702346344.164746 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |
| L1i size | 17405803911.723968 | 8702673786.664586 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |


* Simulation 3:

  `Cache Line Size = 128`  
  `L2 associativity = 1`  
  `L2 size = 32kB`  
  `L1d associativity = 4`  
  `L1d size = 8kB`  
  `L1i associativity = 4`  
  `L1i size = 32kB`  

|         | Specbzip | Spechmmer | Specmcf | Specsjeng | Speclibm |
| ------- | -------  | --------- | ------- | --------- | -------  |
| Cache Line Size | 131251500088.301678 | 66049809242.789668 | 83894962000.795898 | 2184483974840.829496 | 314839532073.850772 |
| L2 associativity | 18487719127.441314 | 8955582496.327927 | 10747733409.730044 | 669456526228.921516 | 77454197352.961171 |
| L2 size | 13413000619.958857 | 5438979955.652825 | 6607315656.746905 | 406734571535.047922 | 47121393884.180969 |
| L1d associativity | 14763513891.856680 | 7520567059.539500 | 8980959667.272840 | 562408991530.152320 | 65081002873.346924 |
| L1d size | 12348925279.089817 | 5672366700.350560 | 7217608935.793984 | 413682582981.679718 | 47851192966.432800 |
| L1i associativity | 20152623810.250867 | 10072031009.079243 | 9521410967.898292 | 753224544084.010193 | 87160802647.018458 |
| L1i size | 17405803911.723968 | 8702673786.664586 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |


* Simulation 4:

  `Cache Line Size = 128`  
  `L2 associativity = 1`  
  `L2 size = 256kB`  
  `L1d associativity = 4`  
  `L1d size = 8kB`  
  `L1i associativity = 4`  
  `L1i size = 32kB`  

|         | Specbzip | Spechmmer | Specmcf | Specsjeng | Speclibm |
| ------- | -------  | --------- | ------- | --------- | -------  |
| Cache Line Size | 131251500088.301678 | 66049809242.789668 | 83894962000.795898 | 2184483974840.829496 | 314839532073.850772 |
| L2 associativity | 18487719127.441314 | 8955582496.327927 | 10747733409.730044 | 669456526228.921516 | 77454197352.961171 |
| L2 size | 15584289266.991432 | 5241197226.558936 | 5944095405.281503 | 358634621536.755408 | 41672639086.935780 |
| L1d associativity | 14763513891.856680 | 7520567059.539500 | 8980959667.272840 | 562408991530.152320 | 65081002873.346924 |
| L1d size | 12348925279.089817 | 5672366700.350560 | 7217608935.793984 | 413682582981.679718 | 47851192966.432800 |
| L1i associativity | 20152623810.250867 | 10072031009.079243 | 9521410967.898292 | 753224544084.010193 | 87160802647.018458 |
| L1i size | 17405803911.723968 | 8702673786.664586 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |

<!---
 L2 size = 32kB
| L2 size | 15584289266.991432 | 5241197226.558936 | 5944095405.281503 | 358634621536.755408 | 41672639086.935780 |
 L2 size = 256kB
| L2 size | 13413000619.958857 | 5438979955.652825 | 6607315656.746905 | 406734571535.047922 | 47121393884.180969 |
 L1i assoc = 2
 | L1i associativity | 17405866077.603584 | 8702346344.164746 | 10396487840.524227 | 650583842744.039640 | 75284864107.943049 |
 L1i assoc = 4
 | L1i associativity | 20152623810.250867 | 10072031009.079243 | 9521410967.898292 | 753224544084.010193 | 87160802647.018458 |
 --->

Από τους παραπάνω πίνακες, βλέπουμε ότι οι αρχιτεκτονικές με `L2 size = 32kB` και `L1i associativity = 2` παρουσιάζουν στις περισσότερες περιπτώσεις χαμηλότερο EADP, άρα
είναι καλύτερες από τις υπόλοιπες. Αφού οι υπόλοιπες παράμετροι μένουν σταθερές, μπορούμε να πούμε ότι το Simulation 1 είναι το βέλτιστο από όλα.


### Σχόλια για την εργασια

Επειδή είχαμε τρέξει τις προσομοιώσεις σε καινούργια έκδοση του gem5 το script GEM5ToMcPAT.py δεν δούλευε επειδή το αρχείο config.json είχε διαφορετική δομή και χρειάστηκε να τις ξανατρέξουμε.

### Πηγές

* <https://www.sciencedirect.com/topics/computer-science/static-power> (Colin Walls, in Embedded Software (Second Edition), 2012)
* Διαλέξεις μαθήματος
* Computer Architecture: A Quantitative Approach (Patterson, Henessey)
* <https://alvinalexander.com/technology/gnuplot-charts-graphs-examples/>
