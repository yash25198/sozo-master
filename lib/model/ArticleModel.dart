class ArticleModel
{
  String title;
  String content, url;

  ArticleModel(
      {this.title, this.content, this.url});
}

List getArticles() {
  return [
    ArticleModel(
      title: "Safety Tips for Pedestrians",
      content:
      "Simple actions on road will keep you safe:\n" +
          "1. Walk with care and with all sense.\n" +
          "2. Look towards oncoming traffic.\n" +
          "3. Never assume driver has seen you when you are about to cross the road, its your responsibility to save yourself.\n" +
          "4. Avoid crossing road where drivers may not be able to see you.\n" +
          "5. Wait for suitable gap in the traffic flow before crossing the road.\n" +
          "6. Never jump over the divider railings. You may tumble on to the traffic.\n" +
          "7. Always hold hands of children while crossing the road.\n" +
          "8. Avoid using roads for morning walks and jogging.\n" +
          "9. Take extra care if you have to cross the road on or near a crest or curve.\n" +
          "10. Avoid crossing road between parked cars.\n" +
          "11. Crossing road by the shortest and most direct route reduces your time on road.\n",

      url: 'https://www.jhpolice.gov.in/road-safety/safety-tips-pedestrian',
    ),

    ArticleModel(
      title: "Avoiding Accidents",
      content:
      'Important ways to avoid accidents:\n' +
          '1. Drive in the prescribed speed limits on the various roads. Always remember that “Speed thrills but kills”.\n' +
          '2. Always put on helmets, seat belts and other safety equipments before driving a bicycle/ motor cycle/vehicle.  Always remember that “Safety saves”.\n' +
          '3. Do not drink and drive.  Always remember that “You cannot hold a pen properly after two pegs, what about the driving wheel?"\n' +
          '4. Never use mobile phones or ear phones while driving.  Always remember   “A mobile call on the road may be the last call of your life”.\n' +
          '5. Know the traffic signs, signals, lights and traffic safety rules before you hit the road.  Always remember that “Road safety rules are best tools to avoid accidents”.\n' +
          '6. Do not drive for long hours in a stretch.  Have a proper beaks after every 2 hours of continuous driving. Always remember that “Man is a man and not a machine”,\n',

      url: 'https://www.wbtrafficpolice.com/step-to-avoid-accident.php',
    ),

    ArticleModel(
      title: "Safety Tips for Women",
      content:
      " 1. Awareness\n 2. Use your sixth sense\n 3. Self-defence training\n 4. Escape\n 5. Your right to fight. \n 6. Carry pepper spray with you at all times.\n" +
          " 7. During home invasions make sure you have a safe room where you can retreat to and contact the authorities.\n 8. Don't reveal your personal information on the" +
          " internet to avoid cyber crimes.\nFor more information go to the link below.\n",
      url: 'https://hyderabadpolice.gov.in/WomenSafety.html',
    ),

    ArticleModel(
      title: "Safety while Travelling",
      content:
      '1. Wait for public transit in a well-lit and populated area.\n' +
          '2. Avoid using electronic devices on the metro rail or metro bus especially when seated near the doors' +
          'Thefts happen quickly, and thieves are more likely to grab phones from the hands of people sitting near the doors.\n' +
          '3. Do not sleep on the bus or Metro. When riding the Metro, sit in a car with other people or in the first car near the conductor.\n' +
          '4. Always lock your bike in the proper manner, with the lock securing both the front tire, and the frame of the bike to the rail.\n' +
          '5. Have a plan when you go out. Decide before you leave how you will get home. Let someone know where you are going, with whom, and what time you plan to return.\n' +
          '6. Learn about the neighborhoods where you live, work, volunteer, and have fun. Know the locations of police and fire stations, hospitals, and shops that are open late.\n',

      url: 'https://discover.trinitydc.edu/safety/personal-safety-and-theft-prevention/',
    ),

    ArticleModel(
      title: "Safety Tips for your Workspace",
      content:
      '1. Lock your office whenever you leave, even if you are only gone a minute.\n' +
          '2. Keep your purse, wallet, and other valuables in a secure location such as a locked desk or filing cabinet.' +
          ' It only takes a few seconds for a theft to take place.\n' +
          '3. Do not bring an excessive amount of cash to work.\n' +
          '4. Do not leave cash or credit cards unattended in the office, especially overnight or over a weekend,' +
          ' unless it is secured in a safe or vault. Desks and filing cabinets are not safe enough for large amounts of cash or purchasing cards.\n' +
          '5. Protect your property through Operation Identification.\n' +
          '6. If you are entrusted with a key to a specific area, never loan it to anyone and keep it secured.\n' +
          '7. Be alert to strangers in your office building.' +
          ' Report any suspicious person loitering in your area to Trinity DPS immediately.\n' +
          '8. Report the loss or theft of keys, equipment, or valuables immediately to Trinity DPS. All crimes, no matter how minor they seem, should be reported.\n',

      url: 'https://discover.trinitydc.edu/safety/safety-tips-for-the-workplace/',
    ),
  ];
}