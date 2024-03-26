package com.zyy.web.utils;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.Tokenizer;

public class MyIKAnalyzer extends Analyzer {
    private boolean useSmart;
    public MyIKAnalyzer() {
        this(false);
    }

    public MyIKAnalyzer(boolean useSmart) {
        this.useSmart = useSmart;
    }

    @Override
    protected TokenStreamComponents createComponents(String s) {
        Tokenizer _MyIKTokenizer = new MyIKTokenizer(this.useSmart());
        return new TokenStreamComponents(_MyIKTokenizer);
    }
    public boolean useSmart() {
        return this.useSmart;
    }
    public void setUseSmart(boolean useSmart) {
        this.useSmart = useSmart;
    }
}
