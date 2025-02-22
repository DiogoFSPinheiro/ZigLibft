


pub fn isalpha(char :u8) !u8
{
    return ((char < 'a') or (char > 'z')) and ((char < 'A') or (char > 'Z'));
}