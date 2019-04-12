" Vim syntax file
" Language:    jasmin
" Author:      Frederik Mogensen <Mogensen@cs.au.dk>
" Last Change: July 24, 2011

" To install, put this file in ~/.vim/syntax/
" and add the lines
"   autocmd BufEnter *.jasmin set syntax=jasmin
"   au Syntax jasmin so $HOME/.vim/syntax/jasmin.vim
" to your ~/.vimrc file

" Remove any old syntax stuff hanging around.
syn clear
syn case match

syn keyword KEYWORD 	aaload aastore aconst_null aload aload_0 aload_1 aload_2 aload_3 aload_4 anewarray areturn arraylength astore astore_0 astore_1 astore_2 astore_3 astore_4 athrow baload bastore bipush breakpoint caload castore checkcast d2f d2i d2l dadd daload dastore dcmpg dcmpl dconst_\d ddiv dload dload_\d dmul dneg drem dreturn dstore dstore_\d dsub dup dup2 dup2_x1 dup2_x2 dup_x1 dup_x2 f2d f2i f2l fadd faload fastore fcmpg fcmpl fconst_\d fdiv fload fload_\d fmul fneg frem freturn fstore fstore_\d fsub getfield getstatic goto goto_w i2b i2c i2d i2f i2l i2s iadd iaload iand iastore iconst_0 iconst_1 iconst_2 iconst_3 iconst_4 iconst_m1 idiv if_acmpeq if_acmpne if_icmpeq if_icmpge if_icmpgt if_icmple if_icmplt if_icmpne ifeq ifge ifgt ifle iflt ifne ifnonnull ifnull iinc iload iload_0 iload_1 iload_2 iload_3 iload_4 impdep1 impdep2 imul ineg instanceof invokeinterface invokespecial invokestatic invokevirtual ior irem ireturn ishl ishr istore istore_0 istore_1 istore_2 istore_3 istore_4 isub iushr ixor jsr jsr_w l2d l2f l2i ladd laload land lastore lcmp lconst_\d ldc ldc_w ldc2_w ldiv lload lload_\d lmul lneg lookupswitch lor lrem lreturn lshl lshr lstore lstore_0 lstore_1 lstore_2 lstore_3 lstore_4 lsub lushr lxor monitorenter monitorexit multianewarray new newarray nop pop pop2 putfield putstatic ret return saload sastore sipush swap tableswitch wide

syn match Number	"-\?[0-9][0-9]*"
syn match Labels	"[a-z][a-z]*[0-9][0-9]*\:*"
syn match NameStart	"[a-z][a-z_0-9]*\s*\~"
syn match Structure	"\*\|||\|&&\|!"

syn region Comment	start=./\*. skip=./\*. end=.\*/.
syn region Comment	oneline start=.//. end=.$.

command -nargs=+ HiLink hi def link <args>
HiLink Instruction		Identifier
HiLink Labels			Define
HiLink NameStart		Define
HiLink NameEnd  		Define
delcommand HiLink
