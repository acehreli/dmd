/**
 * Compiler implementation of the
 * $(LINK2 http://www.dlang.org, D programming language).
 *
 * Copyright:   Copyright (c) 1999-2017 by The D Language Foundation, All Rights Reserved
 * Authors:     $(LINK2 http://www.digitalmars.com, Walter Bright)
 * License:     $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Source:      $(LINK2 https://github.com/dlang/dmd/blob/master/src/ddmd/visitor.d, _visitor.d)
 */

module ddmd.visitor;

import ddmd.astcodegen;
import ddmd.parsetimevisitor;

// Online documentation: https://dlang.org/phobos/ddmd_visitor.html

alias Visitor = GenericVisitor!ASTCodegen;

extern (C++) class GenericVisitor(AST) : ParseTimeVisitor!AST
{
    alias visit = ParseTimeVisitor!AST.visit;
public:
    void visit(AST.ErrorStatement s) { visit(cast(AST.Statement)s); }
    void visit(AST.PeelStatement s) { visit(cast(AST.Statement)s); }
    void visit(AST.UnrolledLoopStatement s) { visit(cast(AST.Statement)s); }
    void visit(AST.SwitchErrorStatement s) { visit(cast(AST.Statement)s); }
    void visit(AST.DebugStatement s) { visit(cast(AST.Statement)s); }
    void visit(AST.DtorExpStatement s) { visit(cast(AST.ExpStatement)s); }
    void visit(AST.ForwardingStatement s)
    {
        if(s.statement)
            s.statement.accept(this);
    }
    void visit(AST.OverloadSet s) { visit(cast(AST.Dsymbol)s); }
    void visit(AST.LabelDsymbol s) { visit(cast(AST.Dsymbol)s); }
    void visit(AST.WithScopeSymbol s) { visit(cast(AST.ScopeDsymbol)s); }
    void visit(AST.ArrayScopeSymbol s) { visit(cast(AST.ScopeDsymbol)s); }
    void visit(AST.OverDeclaration s) { visit(cast(AST.Declaration)s); }
    void visit(AST.SymbolDeclaration s) { visit(cast(AST.Declaration)s); }
    void visit(AST.ThisDeclaration s) { visit(cast(AST.VarDeclaration)s); }
    void visit(AST.TypeInfoDeclaration s) { visit(cast(AST.VarDeclaration)s); }
    void visit(AST.TypeInfoStructDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoClassDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoInterfaceDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoPointerDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoArrayDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoStaticArrayDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoAssociativeArrayDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoEnumDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoFunctionDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoDelegateDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoTupleDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoConstDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoInvariantDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoSharedDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoWildDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.TypeInfoVectorDeclaration s) { visit(cast(AST.TypeInfoDeclaration)s); }
    void visit(AST.FuncAliasDeclaration s) { visit(cast(AST.FuncDeclaration)s); }
    void visit(AST.ErrorInitializer i) { visit(cast(AST.Initializer)i); }
    void visit(AST.ErrorExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.ComplexExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.StructLiteralExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.SymOffExp e) { visit(cast(AST.SymbolExp)e); }
    void visit(AST.OverExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.HaltExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.DotTemplateExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DotVarExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DelegateExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DotTypeExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.VectorExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.SliceExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.ArrayLengthExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DelegatePtrExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DelegateFuncptrExp e) { visit(cast(AST.UnaExp)e); }
    void visit(AST.DotExp e) { visit(cast(AST.BinExp)e); }
    void visit(AST.IndexExp e) { visit(cast(AST.BinExp)e); }
    void visit(AST.ConstructExp e) { visit(cast(AST.AssignExp)e); }
    void visit(AST.BlitExp e) { visit(cast(AST.AssignExp)e); }
    void visit(AST.RemoveExp e) { visit(cast(AST.BinExp)e); }
    void visit(AST.ClassReferenceExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.VoidInitExp e) { visit(cast(AST.Expression)e); }
    void visit(AST.ThrownExceptionExp e) { visit(cast(AST.Expression)e); }
}

extern (C++) class StoppableVisitor : Visitor
{
    alias visit = Visitor.visit;
public:
    bool stop;

    final extern (D) this()
    {
    }
}
