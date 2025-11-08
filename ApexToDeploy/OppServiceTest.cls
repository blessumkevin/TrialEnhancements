@IsTest
public class OppServiceTest {

    @IsTest
    static void testRunDemo() {
        // Calls the main entry point, which in turn calls most of the class
        String result = OppService.runDemo();
        System.assertNotEquals(null, result);
    }

    @IsTest
    static void testHugeComplexMethod() {
        // Exercise complexity logic paths
        String result = OppService.hugeComplexMethod(1, 2, 3, 4, 5, 6, 7);
        System.assertNotEquals(null, result);

        // Trigger division-by-zero branch + catch
        String result2 = OppService.hugeComplexMethod(0, 0, 0, 0, 0, 0, 0);
        System.assertNotEquals(null, result2);
    }

    @IsTest
    static void testDuplicateMethods() {
        System.assertEquals('copy paste', OppService.duplicateA());
        System.assertEquals('copy paste', OppService.duplicateB());
        System.assertEquals('dupe again', OppService.dupeAgain1());
        System.assertEquals('dupe again', OppService.dupeAgain2());
    }

    @IsTest
    static void testManyArgsMethod() {
        OppService.manyArgsMethod('a','b','c','d','e','f','g','h');
        System.assertEquals(8, OppService.GLOBAL_LIST.size());
    }

    @IsTest
    static void testFlagMethods() {
        System.assertEquals(true, OppService.isFlagA(1));
        System.assertEquals(false, OppService.isFlagA(null));
        System.assertEquals(true, OppService.isFlagB(2));
        System.assertEquals(true, OppService.isFlagC(3));
    }

    @IsTest
    static void testBuildFilter() {
        // Not safe in real life — but we want coverage here
        String filter = OppService.buildFilter('Name', 'Value');
        System.assertEquals('Name = \'Value\'', filter);
    }

    @IsTest
    static void testEscapeQuotes() {
        String escaped = OppService.escapeSingleQuotes('O\'Brian');
        System.assertEquals('O\\\'Brian', escaped);
    }
}
