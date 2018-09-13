var webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

//var chrome    = require('selenium-webdriver/chrome');
//var options   = new chrome.Options().headless();

var driver = new webdriver.Builder()
    .forBrowser('chrome')
    // .setChromeOptions(options)
    .usingServer('http://localhost:4444/wd/hub')
    .build();

console.log("Open www.google.com");

driver.get('http://www.google.com');

driver.findElement(By.name('q')).sendKeys('webdriver');

driver.sleep(1000).then(function() {
  driver.findElement(By.name('q')).sendKeys(webdriver.Key.TAB);
});

driver.findElement(By.name('btnK')).click();

driver.sleep(2000).then(function() {
  driver.getTitle().then(function(title) {
    if(title === 'webdriver - Google Search') {
      console.log('Test passed');
    } else {
      console.log('Test failed');
    }
    driver.quit();
  });
});