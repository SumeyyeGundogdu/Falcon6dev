@isTest
public with sharing class CalculatorCalloutTest {
    @isTest
    public static void doAddTest() {
        Test.setMock(webservicemock.class, new CalculatorCalloutMockDivide());
        Test.startTest();
        double d1 = CalculatorCallout.division(21, 7);
        Test.stopTest();

        system.assertEquals(3, d1);

    }

    @isTest
    public static void doAddTest1() {
        Test.setMock(webservicemock.class, new CalculatorCalloutMockSubtract());
        Test.startTest();
        double d1 = CalculatorCallout.subtraction(10, 7);
        Test.stopTest();

        system.assertEquals(3, d1);

    }

    @isTest
    public static void doAddTest2() {
        Test.setMock(webservicemock.class, new CalculatorCalloutMockAdd());
        Test.startTest();
        double d1 = CalculatorCallout.addition(10, 7);
        Test.stopTest();

        system.assertEquals(17, d1);

    }
    @isTest
    public static void doAddTest3() {
        Test.setMock(webservicemock.class, new CalculatorCalloutMockMultip());
        Test.startTest();
        double d1 = CalculatorCallout.multiplication(2, 7);
        Test.stopTest();

        system.assertEquals(14, d1);

    }
}
