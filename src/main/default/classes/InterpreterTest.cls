public with sharing class InterpreterTest {
    public static void testScript() {
        Map<String, Object> context = new Map<String, Object>{
                'a' => 'Foo',
                'b' => 2
        };
        Object result = ScriptEngine.getInstance().eval(' true ? "one" : "Two"');

        System.debug(result);
    }

    public static void testInterpreter() {
        Context context = new Context();
        Expression expression = context.evaluate('1 | 2 & 3', new List<String>{'Name = \'test\'', 'Account.Name = \'test\'', 'Foo = \'test\''});
        System.debug(expression.interpret());
    }
}