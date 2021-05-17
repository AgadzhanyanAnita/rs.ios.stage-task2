#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 reverseN = 0;
    for (NSInteger i = 0; i < 8; ++i) {
        reverseN =  (reverseN << 1) | ((n >> i) & 1);
        // Сначала сдвигаем, так как если это сделать
        // после добавления бита, то в конце потеряем
        // первый добавленный бит. При умножении на 1 узнаем последний бит
    }
    return reverseN;
}
