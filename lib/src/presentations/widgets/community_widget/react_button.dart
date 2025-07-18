import 'package:cct_config/cct_config.dart';
import 'package:cct_core/gen/assets.gen.dart';
import 'package:cct_core/src/presentations/cubit/vote/vote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReactButton extends StatefulWidget {
  final int voteUpCount;
  final int userVoted;
  final Function() onClickCallBack;
  final AnalyticsFromSourceEnum fromSource;
  final VoteCubit? voteCubit;

  const ReactButton({
    super.key,
    required this.voteUpCount,
    required this.userVoted,
    required this.onClickCallBack,
    required this.fromSource,
    this.voteCubit,
  });

  @override
  State<ReactButton> createState() => _ReactButtonState();
}

class _ReactButtonState extends State<ReactButton> {
  late final VoteCubit _voteCubit;

  @override
  void initState() {
    if (widget.voteCubit != null) {
      _voteCubit = widget.voteCubit!;
    } else {
      _voteCubit = VoteCubit();
    }

    _voteCubit.initVoteCount(widget.voteUpCount);
    _voteCubit.initVote(widget.userVoted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _voteCubit,
        builder: (context, state) {
          (state as VoteState);
          return InkWell(
              onTap: () async {
                await widget.onClickCallBack();
                _voteCubit.changeVote();
              },
              child: Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 8,
                  bottom: 8,
                  right: 16,
                ),
                child: Row(
                  children: [
                    if (state.voteUpCount > 0)
                      Row(
                        children: [
                          Text(
                            state.voteUpCount.toString(),
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.grayWarm600),
                          ),
                          const SizedBox(width: 6),
                        ],
                      ),
                    state.vote != 1
                        ? Assets.icon.communityIcon.heartBorder.image(
                            width: 20,
                            color: AppColors.grayWarm600,
                            height: 20,
                          )
                        : Assets.icon.communityIcon.heart.image(
                            width: 20,
                            height: 20,
                          ),
                  ],
                ),
              ));
        });
  }
}
