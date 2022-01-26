public with sharing class Interpreter {
    public static void test() {
        Map<String, Object> context = new Map<String, Object>{
                'a' => 'Foo',
                'b' => 2
        };
        Object result = ScriptEngine.getInstance().eval(' true ? "one" : "Two"');

        System.debug(result);
    }

}