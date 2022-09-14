@IsTest
public class HelloWorldCITest {
    @isTest
    static void helloWorldTest() {
        System.assertEquals(HelloWorldCI.sayHello('Greg Gouveia'), 'Hello Greg Gouveia', 'Expected message does not match the test message.');
    }   
}