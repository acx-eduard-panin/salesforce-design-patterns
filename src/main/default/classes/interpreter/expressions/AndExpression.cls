public with sharing class AndExpression implements Expression {
    private Expression expr1 = null;
    private Expression expr2 = null;

    public AndExpression(Expression expr1, Expression expr2) {
        this.expr1 = expr1;
        this.expr2 = expr2;
    }

    public String interpret() {
        return expr1.interpret() + ' AND '+ expr2.interpret();
    }
}