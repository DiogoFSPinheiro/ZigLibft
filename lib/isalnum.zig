
pub fn isalnum(char :u8) bool
{
    return ((char >= '0') and (char <= '9') or (char >= 'a') and (char <= 'z')) or ((char >= 'A') and (char <= 'Z'));
}