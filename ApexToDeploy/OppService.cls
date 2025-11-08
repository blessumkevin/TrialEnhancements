// OppService.cls
// Purpose: intentionally contains many bad patterns for static scanners to detect.
// SAFE: never executes SOQL/DML/callouts. Use only in scratch orgs / test sandboxes for scanning.

public without sharing class OppService {
    // Global mutable state (bad: hidden coupling, thread-safety, test isolation issues)
    public static Integer GLOBAL_COUNTER = 0;
    public static List<String> GLOBAL_LIST = new List<String>();

    // Hard-coded secret (bad: credentials in code)
    public static final String ADMIN_PASSWORD = 'P@ssw0rd123!DO_NOT_USE_IN_PROD';

    // Unused field (bad: dead code)
    private String unusedField = 'iAmUnused';

    // Duplicated methods below intentionally (bad: copy/paste detected)
    public static String duplicateA() {
        String s = 'copy';
        s += ' paste';
        return s;
    }
    public static String duplicateB() {
        String s = 'copy';
        s += ' paste';
        return s;
    }

    // Extremely long method & high cyclomatic complexity (bad: complexity, maintainability)
    public static String hugeComplexMethod(Integer a, Integer b, Integer c, Integer d, Integer e, Integer f, Integer g) {
        GLOBAL_COUNTER++;
        String result = '';
        // lots of branching to raise complexity
        if (a == null) { result += 'A:null'; }
        if (b == null) { result += 'B:null'; }
        if (a > 10) { result += 'A>10'; } else if (a > 5) { result += 'A>5'; } else { result += 'A<=5'; }
        if (b > 0) result += 'B>0';
        if (c != null && Math.mod(c, 2) == 0) result += 'C even'; // <-- FIXED LINE
        // nested for loops (bad: potential O(n^2) with large input)
        for (Integer i = 0; i < 3; i++) {
            for (Integer j = 0; j < 3; j++) {
                // duplicated code inside loops
                result += 'X' + i + j;
            }
        }
        // long switch (bad: complexity)
        switch on a {
            when 0 { result += 'Z0'; }
            when 1 { result += 'Z1'; }
            when 2 { result += 'Z2'; }
            when else { result += 'Zelse'; }
        }
        // deeply nested conditional (bad readability)
        if (a != null) {
            if (b != null) {
                if (c != null) {
                    result += 'nested';
                }
            }
        }

        // Empty catch (bad: swallowing exceptions)
        try {
            Integer x = 1 / (a == null ? 1 : a); // could divide by zero if a==0 -> caught below
        } catch (Exception ex) {
            // swallow it; don't log -- bad practice
        }

        // Lots of local unused variables (bad: clutter)
        Integer unused1 = 1;
        String unused2 = 'unused';
        Boolean unused3 = false;

        // build "dynamic" SOQL string but DO NOT execute it (bad: dynamic query strings)
        String dangerousQuery = 'SELECT Id, Name FROM Account WHERE Name = \'' + escapeSingleQuotes('Acme' + a) + '\'';
        // Not executing Database.query(dangerousQuery) to keep it safe.

        // Multiple return points (bad: reduces readability)
        if (result.length() > 120) return result.substring(0, 120);
        if (result.contains('Zelse')) return result + '->z';
        return result + 'end';
    }

    // Long parameter list (bad: poor API design)
    public static void manyArgsMethod(String a, String b, String c, String d, String e, String f, String g, String h) {
        // mutate global state (bad: side effects)
        GLOBAL_LIST.addAll(new List<String>{a, b, c, d, e, f, g, h});
    }

    // Method with dangerous name and no access control comments (bad: unclear intent)
    public static String doEverythingAndNoChecks() {
        // Performs many unrelated tasks in one method (bad SRP)
        String out = duplicateA();
        out += duplicateB();
        out += hugeComplexMethod(1,2,3,4,5,6,7);
        manyArgsMethod('a','b','c','d','e','f','g','h');
        out += GLOBAL_COUNTER;
        return out;
    }

    // Helper with weak validation and manual string concatenation (bad: injection-prone when used with queries)
    public static String buildFilter(String field, String value) {
        // no null checks, no escaping (bad)
        return field + ' = \'' + value + '\'';
    }

    // Another duplicate block to trip CPD
    public static String dupeAgain1() {
        String t = 'dupe';
        t += ' again';
        return t;
    }
    public static String dupeAgain2() {
        String t = 'dupe';
        t += ' again';
        return t;
    }

    // Complexity via many small flag methods (bad: unnecessary fragmentation and duplication)
    public static Boolean isFlagA(Integer v) { if (v == null) return false; return v > 0; }
    public static Boolean isFlagB(Integer v) { if (v == null) return false; return v > 0; }
    public static Boolean isFlagC(Integer v) { if (v == null) return false; return v > 0; }

    // Deprecated-style comment to simulate technical debt
    // TODO: fix this later!!!

    // Private method never used (dead code)
    private static void neverUsedPrivate() {
        System.debug('I am never called');
    }

    // Simple helper: escape single quotes (but note this is ad-hoc escaping, not a safe parameterization)
    public static String escapeSingleQuotes(String s) {
        if (s == null) return null;
        return s.replace('\'', '\\\'');
    }

    // Small test driver that returns output — does nothing to org state
    public static String runDemo() {
        try {
            return doEverythingAndNoChecks();
        } catch (Exception ex) {
            // bad: catch and return obscure message (swallows details)
            return 'oops';
        }
    }
}
