#!/usr/bin/perl
# MD5 Decrypt tool by N1ght.Hax0r
# Gausah pake recode recode segala ya kontol

system("clear");
$blue="\033[1;34";
$cyan="\033[1;36m";
$green="\033[1;34m";
$okegreen="\033[92m";
$lightgreen="\033[1;32m";
$white="\033[1;37m";
$purple="\033[1;35m";
$red="\033[1;31m";
$yellow="\033[1;33m";

$dbgtmr = "1";

if ($dbgtmr<=0){ die "Set dbgtmr to a value >=1 !\n";};
use Digest::MD5 qw(md5_hex);
use Time::HiRes qw(gettimeofday);

if ($ARGV[0]=~"a") {
 $alpha = "abcdefghijklmnopqrstuvwxyz";}
if ($ARGV[0]=~"A") {
 $alpha = $alpha. "ABCDEFGHIJKLMNOPQRSTUVWXYZ";}
if ($ARGV[0]=~"0") {
 $alpha = $alpha."1234567890";}
if ($ARGV[0]=~"!") {
 $alpha = $alpha. "!\"\$%&/()=?-.:\\*'-_:.;,";}

if ($alpha eq "" or $ARGV[3] eq "") {usage();};
if (length($ARGV[3]) != 32) { die "$red ERROR!!$white MD5$red not Valid\n";};

print "$cyan                                          
  _____ ____  ___    _____         _       
 |     |    \\|  _|  | __  |___ _ _| |_ ___ 
 | | | |  |  |_  |  | __ -|  _| | |  _|  _|
 |_|_|_|____/|___|  |_____|_| |___|_| |_|  
                                          
$white ========================[$yellow Ver.1.5$white ]========

$okegreen By$red  :$white N1ght.Hax0r
$okegreen Git$red :$white https://github.com/N1ght420

$white ===========[$yellow Code Your Freedom$white ]===========

$okegreen Charset$red :$white '$alpha\'
$okegreen Hash$red    :$white '$ARGV[3]'


";
sleep(1);

for (my $t=$ARGV[1];$t<=$ARGV[2];$t++){
 crack ($t);
}

sub usage{
print "$cyan                                          
  _____ ____  ___    _____         _       
 |     |    \\|  _|  | __  |___ _ _| |_ ___ 
 | | | |  |  |_  |  | __ -|  _| | |  _|  _|
 |_|_|_|____/|___|  |_____|_| |___|_| |_|  
                                          
$white ========================[$yellow Ver.2.0$white ]========

$okegreen By$red  :$white N1ght.Hax0r
$okegreen Git$red :$white https://github.com/N1ght420

$white ===========[$yellow Code Your Freedom$white ]===========

$okegreen Charset$red :$white aA0!
$white ~$okegreen   a$red   :$white abcdefghijklmnopqrstuvwxyz
$white ~$okegreen   A$red   :$white ABCDEFGHIJKLMNOPQRSTUVWXYZ
$white ~$okegreen   0$red   :$white 1234567890
$white ~$okegreen   !$red   :$white !\"\$%&/()=?-.:\\*'-_:.;,

$okegreen Usage$red   :$white ./md5.pl <charset> <min> <max> <MD5>
$okegreen example$red :$white ./md5.pl a0 1 8 42113418fb3d3bf24b8bab323786bc30


";
die;
}

sub crack{
######################################## Slow Crack With Color ########################################

 $CharSet = shift;
 @RawString = ();
 for (my $i =0;$i<$CharSet;$i++){ $RawString[i] = 0;}
 $Start = gettimeofday();
 do{
  for (my $i =0;$i<$CharSet;$i++){
   if ($RawString[$i] > length($alpha)-1){
    if ($i==$CharSet-1){
    print "$okegreen Bruteforcing done with$white  $CharSet $okegreen Chars. $red No Results.\n";
    $cnt=0;
    return false;
   }
   $RawString[$i+1]++;
   $RawString[$i]=0;
   }
  }

   $ret = "";
   for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}
   $hash = md5_hex($ret);
   $cnt++;
   $Stop = gettimeofday();
   if ($Stop-$Start>$dbgtmr){
    $cnt = int($cnt/$dbgtmr);
    print "$cnt hashes\\second.\tLast Pass '$ret\'\n";
    $cnt=0;
    $Start = gettimeofday();
   }
            print "$okegreen $hash $white [$red  $ret $white ]\n";
   if ($ARGV[3] eq $hash){
    die "\n$okegreen Password$red >$white $ret\n";
   }

  $RawString[0]++;
 }while($RawString[$CharSet-1]<length($alpha));

######################################## Slow Crack With Color ########################################

######################################### Fast Crack No Color #########################################
#
# $CharSet = shift;
# @RawString = ();
# for (my $i =0;$i<$CharSet;$i++){ $RawString[i] = 0;}
# $Start = gettimeofday();
# do{
#  for (my $i =0;$i<$CharSet;$i++){
#   if ($RawString[$i] > length($alpha)-1){
#    if ($i==$CharSet-1){
#    print "$okegreen Bruteforcing done with$white  $CharSet $okegreen Chars. $red No Results.\n";
#    $cnt=0;
#    return false;
#   }
#   $RawString[$i+1]++;
#   $RawString[$i]=0;
#   }
#  }
#
#   $ret = "";
#   for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}
#   $hash = md5_hex($ret);
#   $cnt++;
#   $Stop = gettimeofday();
#   if ($Stop-$Start>$dbgtmr){
#    $cnt = int($cnt/$dbgtmr);
#    print "$cnt hashes\\second.\tLast Pass '$ret\'\n";
#    $cnt=0;
#    $Start = gettimeofday();
#   }
#            print " $hash [  $ret  ]\n";
#   if ($ARGV[3] eq $hash){
#    die "\n$okegreen Password$red >$white $ret\n";
#   }
#
#  $RawString[0]++;
# }while($RawString[$CharSet-1]<length($alpha));
#
######################################### Fast Crack No Color #########################################
}

sub checkhash{
 $CharSet = shift;
 $ret = "";
 for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}
 $hash = md5_hex($ret);
 $cnt++;
 $Stop = gettimeofday();
 if ($Stop-$Start>$dbgtmr){
  $cnt = int($cnt/$dbgtmr);
  print "$cnt hashes\\second.\tLast Pass '$ret\'\n";
  $cnt=0;
  $Start = gettimeofday();
 }

 if ($ARGV[3] eq $hash){
  die "\n$okegreen Password$red >$white $ret\n";
 }
 
}
