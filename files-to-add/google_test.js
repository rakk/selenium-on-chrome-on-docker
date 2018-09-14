var webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

//var chrome    = require('selenium-webdriver/chrome');
//var options   = new chrome.Options().headless();

var chromeCapabilities = webdriver.Capabilities.chrome();
//setting chrome options to start the browser fully maximized
var chromeOptions = {
    'args': ['disable-gpu', 'headless', 'no-sandbox']
};
chromeCapabilities.set('chromeOptions', chromeOptions);

var driver = new webdriver.Builder()
    .forBrowser('chrome')
    // .setChromeOptions(options)
    .usingServer('http://localhost:4444/wd/hub')
    .withCapabilities(chromeCapabilities)
    .build();


console.log("Open page:");

driver.get('https://www.apple.com/iphone/');

driver.sleep(2000).then(function() {
  driver.getTitle().then(function(title) {
    var expectedTitle = "iPhone - Apple";
    if(title === expectedTitle) {
      console.log('Test passed');
    } else {
      console.log("Expected title: " + expectedTitle + " but was " + title);
      console.log('Test failed');
    }
    driver.quit();
  });
});