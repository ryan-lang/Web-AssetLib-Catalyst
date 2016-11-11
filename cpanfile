requires 'perl', '5.018004';

requires 'Web::AssetLib';
 
on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::Compile';
};

