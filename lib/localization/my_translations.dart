import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Snackbars
          'Error': 'Error',
          'Location permissions are denied': 'Location permissions are denied',
          'Location permissions are permanently denied, we cannot request permissions.':
              'Location permissions are permanently denied, we cannot request permissions.',
          'Location services are not enabled. Please enable location services.':
              'Location services are not enabled. Please enable location services.',
          'Both stations are the same': 'Both stations are the same',
          'No internet connection': 'No internet connection',
          'Invalid address format': 'Invalid address format',
          'Source and destination are the same':'Source and destination are the same',
          'Something went wrong': 'Something went wrong',
          // Welcome section
          'Welcome to Metrok': 'Welcome to Metrok',
          'Nearest station: ': 'Nearest station: ',
          'Loading ...': 'Loading ...',
          // Station - location tabs
          'Stations': 'Stations',
          'Locations': 'Locations',
          // Dropdown
          'Select first station': 'Select first station',
          'Select last station': 'Select last station',
          'Search': 'Search',
          // Text field
          'Write start location': 'Write start location',
          'Write destination': 'Write destination',
          'Your current location': 'Your current location',
          // Bottom sheet
          'Shortest route': 'Shortest route',
          'The only route': 'The only route',
          'Another route': 'Another route',
          'Direction: ': 'Direction: ',
          'Exchange station: ': 'Exchange station: ',
          'First direction: ': 'First direction: ',
          'Second direction: ': 'Second direction: ',
          'Number of stations: ': 'Number of stations: ',
          'Ticket price: ': 'Ticket price: ',
          '8 EGP': '8 EGP',
          '10 EGP': '10 EGP',
          '15 EGP': '15 EGP',
          '20 EGP': '20 EGP',
          'Arrival time: ': 'Arrival time: ',
          'hour &': 'Hour &',
          'minute': 'Minute',
          'minutes': 'Minutes',
          'Stations names': 'Stations names: ',
          'More': 'More',
          // More details bottom sheet
          'Route Summary': 'Route Summary',
          'First & Last station': 'First & Last station',
          'Journey Information': 'Journey Information',
          'Stations you will pass through': 'Stations you will pass through',
          // Stations
          'helwan': 'Helwan',
          'ain helwan': 'Ain Helwan',
          'helwan university': 'Helwan University',
          'wadi hof': 'Wadi Hof',
          'hadayek helwan': 'Hadayek Helwan',
          'el-mmaasara': 'El-Mmaasara',
          'tora el-asmant': 'Tora El-Asmant',
          'kozzika': 'Kozzika',
          'tora el-balad': 'Tora El-Balad',
          'sakanat el-maadi': 'Sakanat El-Maadi',
          'maadi': 'Maadi',
          'hadayek el-maadi': 'Hadayek El-Maadi',
          'dar el-salam': 'Dar El-Salam',
          'el-zahraa': 'El-Zahraa',
          'mar girgis': 'Mar Girgis',
          'el-malek el-saleh': 'El-Malek El-Saleh',
          'al-sayeda zeinab': 'Al-Sayeda Zeinab',
          'saad zaghloul': 'Saad Zaghloul',
          'sadat': 'Sadat',
          'nasser': 'Nasser',
          'orabi': 'Orabi',
          'al-shohadaa': 'Al-Shohadaa',
          'ghamra': 'Ghamra',
          'el-demerdash': 'El-Demerdash',
          'manshiet el-sadr': 'Manshiet El-Sadr',
          'kobri el-qobba': 'Kobri El-Qobba',
          'hammamat el-qobba': 'Hammamat El-Qobba',
          'saray el-qobba': 'Saray El-Qobba',
          'hadayeq el-zaitoun': 'Hadayeq El-Zaitoun',
          'helmeyet el-zaitoun': 'Helmeyet El-Zaitoun',
          'el-matareyya': 'El-Matareyya',
          'ain shams': 'Ain Shams',
          'ezbet el-nakhl': 'Ezbet El-Nakhl',
          'el-marg': 'El-Marg',
          'new el-marg': 'New El-Marg',
          'el-mounib': 'El-Mounib',
          'sakiat mekky': 'Sakiat Mekky',
          'omm el-masryeen': 'Omm El-Masryeen',
          'el-giza': 'El-Giza',
          'faisal': 'Faisal',
          'cairo university': 'Cairo University',
          'el-bohoth': 'El-Bohoth',
          'dokki': 'Dokki',
          'opera': 'Opera',
          'mohamed naguib': 'Mohamed Naguib',
          'attaba': 'Attaba',
          'masarra': 'Masarra',
          'road el-farag': 'Road El-Farag',
          'st. teresa': 'St. Teresa',
          'khalafawy': 'Khalafawy',
          'mezallat': 'Mezallat',
          'kolleyyet el-zeraa': 'Kolleyyet El-Zeraa',
          'shubra el-kheima': 'Shubra El-Kheima',
          'shubra': 'Shubra',
          'ring road': 'Ring Road',
          'al-qawmeya al-arabiya': 'Al-Qawmeya Al-Arabiya',
          'el-bohy': 'El-Bohy',
          'imbaba': 'Imbaba',
          'sudan street': 'Sudan Street',
          'kit kat': 'Kit Kat',
          'safaa hegazy': 'Safaa Hegazy',
          'maspero': 'Maspero',
          'bab el-shaaria': 'Bab El-Shaaria',
          'el-geish': 'El-Geish',
          'abdou pasha': 'Abdou Pasha',
          'abbassia': 'Abbassia',
          'fair zone': 'Fair Zone',
          'stadium': 'Stadium',
          'koleyet el-banat': 'Koleyet El-Banat',
          'al-ahram': 'Al-Ahram',
          'haroun': 'Haroun',
          'heliopolis square': 'Heliopolis Square',
          'alf maskan': 'Alf Maskan',
          'nadi el-shams': 'Nadi El-Shams',
          'el-nozha': 'El-Nozha',
          'hesham barakat': 'Hesham Barakat',
          'qobaa': 'Qobaa',
          'omar ibn el-khattab': 'Omar Ibn El-Khattab',
          'el-haykestep': 'El-Haykestep',
          'adly mansour': 'Adly Mansour',
          'airport': 'Airport',
        },
        'ar': {
          // Snackbars
          'Error': 'خطأ',
          'Location permissions are denied': 'Location permissions are denied',
          'Location permissions are permanently denied, we cannot request permissions.':
              'تم رفض أذونات الموقع بشكل دائم، ولا يمكننا طلب الأذونات.',
          'Location services are not enabled. Please enable location services.':
              'لم يتم تفعيل خدمات الموقع. يرجى تفعيل خدمات الموقع.',
          'Both stations are the same': 'كلتا المحطتين متماثلتان',
          'No internet connection': 'لا يوجد اتصال بالانترنت',
          'Invalid address format': 'صيغه العنوان غير صالحه',
          'Source and destination are the same': 'المصدر والوجهة متماثلان',
          'Something went wrong': 'حدث خطأ ما',
          // Welcome section
          'Welcome to Metrok': 'مرحبا بك في ميتروك',
          'Nearest station: ': 'أقرب محطه هي: ',
          'Loading ...': 'تحميل ...',
          // Station - location tabs
          'Stations': 'المحطات',
          'Locations': 'الموقع',
          // Dropdown
          'Select first station': 'اختر المحطه الاولي',
          'Select last station': 'اختر المحطه الاخيره',
          'Search': 'ابحث',
          // Text field
          'Write start location': 'اكتب عنوانك الحالي',
          'Write destination': 'اكتب عنوان واجهتك ',
          'Your current location': 'موقعك الحالي',
          // Bottom sheet
          'Shortest route': 'أقصر طريق',
          'The only route': 'الطريق الوحيد',
          'Another route': 'طريق اخر',
          'Direction: ': 'الاتجاه:',
          'Exchange station: ': 'المحطه التبادليه: ',
          'First direction: ': 'الاتجاه الأول: ',
          'Second direction: ': 'الاتجاه الثاني: ',
          'Number of stations: ': 'عدد المحطات:',
          'Ticket price: ': 'سعر التذكره:',
          '8 EGP': '8 جنيه',
          '10 EGP': '10 جنيه',
          '15 EGP': '15 جنيه',
          '20 EGP': '20 جنيه',
          'Arrival time: ': 'وقت الوصول:',
          'hour &': 'ساعه و',
          'minute': 'دقيقه',
          'Stations names': 'أسماء المحطات:',
          'More': 'المزيد',
          // More details bottom sheet
          'Route Summary': 'ملخص الرحلة',
          'Start and End Stations': 'المحطه الاولي والاخيره',
          'Journey Information': 'تفاصيل الرحله',
          'Stations you will pass through': 'المحطات التي ستمر بها',
          // Stations
          'helwan': 'حلوان',
          'ain helwan': 'عين حلوان',
          'helwan university': 'جامعه حلوان',
          'wadi hof': 'وادي حوف',
          'hadayek helwan': 'حدائق حلوان',
          'el-mmaasara': 'المصرة',
          'tora el-asmant': 'طره الاسمنت',
          'kozzika': 'كوتسيكا',
          'tora el-balad': 'طره البلد',
          'sakanat el-maadi': 'سكنات المعادي',
          'maadi': 'المعادي',
          'hadayek el-maadi': 'حدائق المعادي',
          'dar el-salam': 'دار السلام',
          'el-zahraa': 'الزهراء',
          'mar girgis': 'مار جرجس',
          'el-malek el-saleh': 'الملك الصالح',
          'al-sayeda zeinab': 'السيدة زينب',
          'saad zaghloul': 'سعد زغلول',
          'sadat': 'السادات',
          'nasser': 'ناصر',
          'orabi': 'عرابي',
          'al-shohadaa': 'الشهداء',
          'ghamra': 'غمرة',
          'el-demerdash': 'الدمرداش',
          'manshiet el-sadr': 'منشية الصدر',
          'kobri el-qobba': 'كوبري القبة',
          'hammamat el-qobba': 'حمامات القبة',
          'saray el-qobba': 'سراي القبة',
          'hadayeq el-zaitoun': 'حدائق الزيتون',
          'helmeyet el-zaitoun': 'حلمية الزيتون',
          'el-matareyya': 'المطرية',
          'ain shams': 'عين شمس',
          'ezbet el-nakhl': 'عزبة النخل',
          'el-marg': 'المرج',
          'new el-marg': 'المرج الجديدة',
          'el-mounib': 'المنيب',
          'sakiat mekky': 'ساقية مكي',
          'omm el-masryeen': 'أم المصريين',
          'el-giza': 'الجيزة',
          'faisal': 'فيصل',
          'cairo university': 'جامعة القاهرة',
          'el-bohoth': 'البحوث',
          'dokki': 'الدقي',
          'opera': 'الأوبرا',
          'mohamed naguib': 'محمد نجيب',
          'attaba': 'العتبة',
          'masarra': 'مسرّة',
          'road el-farag': 'روض الفرج',
          'st. teresa': 'سانت تريزا',
          'khalafawy': 'الخلفاوي',
          'mezallat': 'المظلات',
          'kolleyyet el-zeraa': 'كلية الزراعة',
          'shubra el-kheima': 'شبرا الخيمة',
          'shubra': 'شبرا',
          'ring road': 'الطريق الدائري',
          'al-qawmeya al-arabiya': 'القومية العربية',
          'el-bohy': 'البوهي',
          'imbaba': 'إمبابة',
          'sudan street': 'شارع السودان',
          'kit kat': 'الكيت كات',
          'safaa hegazy': 'صفاء حجازي',
          'maspero': 'ماسبيرو',
          'bab el-shaaria': 'باب الشعرية',
          'el-geish': 'الجيش',
          'abdou pasha': 'عبده باشا',
          'abbassia': 'العباسية',
          'fair zone': 'منطقة المعارض',
          'stadium': 'استاد القاهرة',
          'koleyet el-banat': 'كلية البنات',
          'al-ahram': 'الأهرام',
          'haroun': 'هارون',
          'heliopolis square': 'ميدان هليوبوليس',
          'alf maskan': 'ألف مسكن',
          'nadi el-shams': 'نادي الشمس',
          'el-nozha': 'النزهة',
          'hesham barakat': 'هشام بركات',
          'qobaa': 'قباء',
          'omar ibn el-khattab': 'عمر بن الخطاب',
          'el-haykestep': 'الهايكستب',
          'adly mansour': 'عدلي منصور',
          'airport': 'المطار',
        }
      };
}
