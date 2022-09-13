@isTest
public with sharing class HelloWorldCITest {
    @isTest
    static void HelloWorldCITest() {
        system.assertEquals(HelloWorldCI.sayHello('Greg Gouveia'), 'Hello Greg Gouveia', 'Expected message does not match the test message.');
    }
}
