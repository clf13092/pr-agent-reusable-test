// JavaScript設定ファイル - 意図的にセキュリティ違反を含む

const config={
    // ハードコーディングされた機密情報
    apiKey:"sk-1234567890abcdef",
    databaseUrl:"mongodb://admin:password123@localhost:27017/mydb",
    jwtSecret:"super-secret-jwt-key-that-should-not-be-hardcoded",
    
    // 不適切な設定
    debug:true,
    allowCors:"*",
    
    // AWS認証情報のハードコーディング
    aws:{
        accessKeyId:"AKIAIOSFODNN7EXAMPLE",
        secretAccessKey:"wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLExxxx",
        region:"us-east-1"
    }
};

module.exports=config;
