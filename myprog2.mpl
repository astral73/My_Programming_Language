BEGIN;

int: a==0;
int: b;
int: c==0;

ask c;
print c;

for(a==0 ; a<10 ; a==c)
{
print a;
}

b==c%10;
print b;

if(b>=0)
{
print b;
}

else
{
print c;
}

END;
